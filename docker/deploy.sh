echo "Installing awscli..."
pip install --user awscli

echo "Configuring aws cli..."
aws configure set region $AWS_REGION
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY

echo "Updating ecs service..."
aws ecs update-service --cluster arn:aws:ecs:eu-central-1:408298911564:cluster/default --service azure-devops-yaml-demo-service --force-new-deployment

