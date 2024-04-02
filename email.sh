# 设置 msmtp 配置文件路径
msmtp_config="$HOME/.msmtprc"

# 检查 msmtp 配置文件是否存在，不存在则创建并设置权限
if [ ! -f "$msmtp_config" ]; then
    touch "$msmtp_config"
    chmod 600 "$msmtp_config"
fi

# 编辑 msmtp 配置文件
cat <<EOF > "$msmtp_config"
# 设置默认帐户
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
EOF

# 添加发件人配置
echo "account default" >> "$msmtp_config"
echo "host smtp.163.com" >> "$msmtp_config"
echo "port 25" >> "$msmtp_config"
echo "from wzf1.happy@163.com" >> "$msmtp_config"
echo "auth login" >> "$msmtp_config"
echo "user wzf1.happy@163.com" >> "$msmtp_config"
echo "password zifangwang21990120" >> "$msmtp_config"

# 发送邮件
echo "测试" | msmtp -a default -t public@hotmail.com #公邮地址不知道从哪里获取..