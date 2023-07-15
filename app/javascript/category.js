// ブラウザが読み込まれて、loadイベントが発火する
window.addEventListener('load', function () {

  const parentCategory = document.getElementById('parent-category')
  const selectWrap = document.getElementById('select-wrap')

  const selectChildElement = (selectForm) => {
    if (document.getElementById(selectForm) !== null) {
      document.getElementById(selectForm).remove()
    }
  }

  // Ajax通信を可能にする
  const XHR = new XMLHttpRequest();
  const categoryXHR = (id) => {
    XHR.open("GET", `/category/${id}`, true);
    XHR.responseType = "json";
    XHR.send();
  }

  // 子カテゴリーの値を全て取得する関数
  const getChildCategoryData = () => {
    const parentValue = parentCategory.value
    categoryXHR(parentValue)

    // コントローラーからJSON形式でレスポンスの受信が成功した時に、onloadが発火する
    XHR.onload = () => {
      const items = XHR.response.item;
      appendChildSelect(items)
      const childCategory = document.getElementById('child-select')

    }
  }

  // 子カテゴリーのプルダウンを表示させる関数
  const appendChildSelect = (items) => {

    const childWrap = document.createElement('div')
    const childSelect = document.createElement('select')

    childWrap.setAttribute('id', 'child-select-wrap')
    childWrap.classList.add('form-floating');
    childSelect.setAttribute('id', 'child-select')
    childSelect.classList.add('form-select')
    childSelect.setAttribute('name', 'category_id');

    // forEach文でitem（子カテゴリーの値）を繰り返す
    items.forEach(item => {
      const childOption = document.createElement('option')
      childOption.innerHTML = item.category_name
      childOption.setAttribute('value', item.id)
      childSelect.appendChild(childOption)
    });

    childWrap.appendChild(childSelect)
    selectWrap.appendChild(childWrap)
  }

  // 親カテゴリーを選択した後の発火するイベント
  parentCategory.addEventListener('change', function () {
    selectChildElement('child-select-wrap')
    getChildCategoryData()
  })
})