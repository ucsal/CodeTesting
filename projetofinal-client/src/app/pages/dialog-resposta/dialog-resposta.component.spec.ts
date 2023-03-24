import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogRespostaComponent } from './dialog-resposta.component';

describe('DialogRespostaComponent', () => {
  let component: DialogRespostaComponent;
  let fixture: ComponentFixture<DialogRespostaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogRespostaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogRespostaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
