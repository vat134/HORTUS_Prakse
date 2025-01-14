MainDiv = document.createElement('div');
MainDiv.id = 'maindiv';
MainDiv.className = 'maindiv';
MainDiv.innerHTML ='<div id ButtonDiv1>' +
'<button id=button1> get responce </button>' +
'</div>' +
'<div id=contentDiv></div>';
ParentDiv = document.getElementById('controlAddIn');
ParentDiv.appendChild(MainDiv);

document.querySelector('#button1').addEventListener('click', getResponse)

function getResponse(){
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('getResponse', '');
}

/*function ResponseData(InvData) {
    ParentDiv = document.getElementById('contentDiv');
    InvDataElement = document.createElement('h3');
    InvDataElement.id = 'content';
    InvDataElement.innerText = InvData['content'];
    ParentDiv.appendChild(InvDataElement);
}*/

  function ResponseData(InvData) {
    console.log('Received data:', InvData);
    content = InvData.choices[0].message.content;
    console.log('Content:', content);

    ParentDiv = document.getElementById('contentDiv');
    InvDataElement = document.createElement('h3');
    InvDataElement.id = 'content';
    InvDataElement.innerText = content || 'No content received';
    ParentDiv.appendChild(InvDataElement);
}