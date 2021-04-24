# udemy-microsoft-azure-on-terraform

## Windows10(WSL2)セットアップ
### terraformインストール
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform
terraform -version
```

### tfenvインストール
```
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
tfenv install
tfenv list
```

### azコマンドインストール
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

## spnの作成
### Azureへのログイン
```
az login
```

### spnの表示
```
az account show --query "{subscriptionId:id, tenantId:tenantId}"
```

### spn作成
```
az ad sp create-for-rbac --role="Contributor" \
--scopes="/subscriptions/8778dxxx-xxxx-xxxx-xxxx-489df6axxxxx"
```

### ログインできるか試す
```
az login --service-principal \
-u "42982ac2-1b39-479axxxxxxxxxxxxxxa967" \
-p "a6~Xt7JBxxxxxxxxxxxxxxxxxmIPTGxX_~" \
-t "66674ed0-005d-4b5a-9138-2a7725b9df89"
```

### コマンドが効くか試す
```
az vm list-sizes --location westus --output table | head -5
```

### 環境変数定義
```
export ARM_SUBSCRIPTION_ID="961111xxxxxxxxxxxxxxxxxx6a1149bb2521"
export ARM_CLIENT_ID="42982ac2-xxxxxxxxxxxxxxxxxd05bc9a967"
export ARM_CLIENT_SECRET="a6~Xt7xxxxxxxxxxxxxxxxxxxxxPTGxX_~"
export ARM_TENANT_ID="66674ed0-005d-4b5a-9138-2a7725b9df89"
```
