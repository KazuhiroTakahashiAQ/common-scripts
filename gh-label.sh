#!/bin/bash

# 流し込みたいリポジトリを指定
# sh gh-lable.sh ${organization-name}/{repository-name}
REPO="$1"

labels=(
  "❎Close: Duplicate🔚|duplicate 重複issue/PR、内容を書いてclose|ffffff"
  "❎Close: Invalid❌|invalid : 対応不十分、対応不可能、何が、なんでだめだったか理由を書いてclose|ffffff"
  "❎Close: Wontfix🔜|wontfix : 対応しない理由を書いてclose|ffffff"
  "⛔Do not merge|do not merge : merge禁止|D26455"
  "🔎Feedback: Research|research : 調査タスク、本流のブランチにmergeしない|c2e0c6"
  "🆘 Feedback: Support|help question : サポート、アドバイス、意見求む|c2e0c6"
  "👑Priority: Critical🚀|priority critical : 優先度緊急、hotfix等、すぐに確認|ee0000"
  "👑Priority: High✈️|priority high: 優先度高、これが完了しないと後続のタスクに影響が大きい|ffff00"
  "renovate||ededed"
  "🚥Status: Pending🔒|pending : 確認事項等があり凍結中、レビューも不要|156FE3"
  "🚥Status: Review Needed👀|review needed : レビューして|156FE3"
  "🚥Status: WIP🚧|wip : 作業中|156FE3"
  "🔑Type: Breaking change⚠️|breaking change : 破壊的変更、機能削除|aaeeee"
  "🔑Type: BugFix🐛|bug fix : 壊れていた部分の修正|aaeeee"
  "🔑Type: Chore📝|chore : document、ADR等その他どれにも当てはまらない変更|aaeeee"
  "🔑Type: Feature✨|feature : 機能追加|aaeeee"
  "🔑Type: Maintenance🔧|maintenance : CI/CD,Lint,build周り等開発者向けの変更|aaeeee"
  "🔑Type: Meta👻|リポジトリ自体に関連する変更(.vscodeやrenovate等)、修正等(このPRはリリースノートに反映されない)|aaeeee"
  "🔑Type: Performance💹|performance : パフォーマンスチューニング、およびそれにかかわる変更|aaeeee"
  "🔑Type: Refactoring♻️|refactoring : コード整理など、機能に影響を及ぼさない変更|aaeeee"
  "🔑Type: Release🐬|Release: リリース処理に関わる(このPRはリリースノートに反映されない)|aaeeee"
  "🔑Type: Security🚓|Security: 安全に関わる修正|aaeeee"
  "🔑Type: Style💎|style: スタイリング、デザイン変更|aaeeee"
  "🔑Type: Test💡|test : テストのみの変更|aaeeee"
)

for entry in "${labels[@]}"; do
  IFS="|" read -r name description color <<<"$entry"

  echo "Creating: $name"

  gh label create "$name" \
    --description "$description" \
    --color "$color" \
    --repo "$REPO" \
    --force
done
