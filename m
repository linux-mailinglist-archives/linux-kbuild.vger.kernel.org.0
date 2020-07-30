Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717402333AE
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jul 2020 15:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgG3N64 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jul 2020 09:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729356AbgG3N6v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jul 2020 09:58:51 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03728C06179E
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2020 06:58:45 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 11so25663077qkn.2
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2020 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=QcYaplpioI9MLsAnqd4iIIXoRVUu0Gh7RceGnF833lA=;
        b=N4Z4RakBM2wV4gC7nQk0xwWWVeN3klc8op0Mk2CW0asWsybhcYjcqG9tXF5CAp34+C
         /48qr3maDPv/t630d0nk8A9IC9nLLSt3V9v/4EwGV7gmnDsCOjHc4+wE6u+uH7D42skO
         JViIBTEm+Kn39mD4B4EE60RBY8x1IhEU/ALZ4XHQpuLrT58O4vSu9i000u87K9I7xafn
         6Nm7wuoCSz7ugstbB8mXdHoesEC21V5gMIJfqBtpjIQfTucJ8Q0mY+wh8227ElItbQ1+
         UYObLJKFLeQw0iFto8QqK9nwOrdMAPSDoJE7eCmJu0RaBTjqB/0Mvi2KeHL8Cat3pgA/
         Q1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=QcYaplpioI9MLsAnqd4iIIXoRVUu0Gh7RceGnF833lA=;
        b=C5J9RNojTpwBDT7B/2QeQA2dke3I731CAnjNMrZX98j7FAKQjWpiL266THZBxIow+R
         06IStygkWgXzIlIfIo6IbkPWhckAOOo55vbuaZYPQYK83ncZ5Co+givfYid/o7gX2QTK
         Ha3hP4ONbdQwoMy0clGbSeoff3GM6SmtVq4qCUs/tbkFXqAj2mTBdGTZ/pAEtNsd9RjE
         QhwzimVrv6g7cMNifs6PBqTvuKx8Bjk9tN1avq+zGzVnQK65R2D0NKF+9mZ/bmB4tkzk
         a6sgYQhz/hjWwaQE546T/CKEEo4i1ptm5IFRGx9OZTgvpCxkRBE8lPLMDZtbjdUl7J4N
         q59A==
X-Gm-Message-State: AOAM533sguuucW5Nlfsde9JEfVKv+4pdBA3JcQjTuv4NKAYF/f6oS9ye
        u1yI06bAQLZ8qoJfOzCi8Y9l7XIvuCelbr5530s=
X-Google-Smtp-Source: ABdhPJxXRtIkxPR5QyGlU6RL+jTImtmyLwSd5A22K8DCRm4H/4H0zglJszZ1qXhvAGqYCVC8G0WMAskSvM4A8JHJWDw=
X-Received: by 2002:a37:e315:: with SMTP id y21mr4173746qki.129.1596117525129;
 Thu, 30 Jul 2020 06:58:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:24ba:0:0:0:0:0 with HTTP; Thu, 30 Jul 2020 06:58:44
 -0700 (PDT)
Reply-To: godardchambers1@yandex.com
From:   "Luis F. Godard" <veronicadeerow@gmail.com>
Date:   Thu, 30 Jul 2020 15:58:44 +0200
Message-ID: <CAOXWAkNbNaLQRf3=+tJ-wVuQxCuLfwS+PkyxihhBK01tbCStbA@mail.gmail.com>
Subject: =?UTF-8?B?SmUgdG8gbmFsw6loYXbDoSB6cHLDoXZhLA==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SmUgdG8gbmFsw6loYXbDoSB6cHLDoXZhLA0KDQpKYWsgb2JlY27Emz8gRG91ZsOhbSwgxb5lIHNl
IHRhdG8genByw6F2YSBzIHbDoW1pIGRvYsWZZSBzZXRrw6F2w6EuDQpOZXphcG9tZcWIdGUgcHJv
c8OtbSB0dXRvIHpwcsOhdnUgbmEgcm96ZMOtbCBvZCBkxZnDrXbEm2rFocOtY2gsIHByb3Rvxb5l
IHbDocWhDQpkxJtkaWNrw70gZm9uZCB2ZSB2w73FoWkgOSwyIG1pbGlvbnUgVVNEIG55bsOtIG9k
aGFsdWplIHZhxaFpIG9rYW3Fvml0b3UNCnBveml0aXZuw60gb2Rwb3bEm8SPLiBWeXrDvXbDoW0g
dsOhcyB2xaFhaywgYWJ5c3RlIGxhc2thdsSbIHDFmWVkYWxpIHN2w6kgY2Vsw6kNCmptw6lubzog
WmVtxJs6IEFkcmVzYTogUG92b2zDoW7DrTogUm9kaW5uw70gc3RhdjogUG9obGF2w606IFbEm2s6
IFNvdWtyb23DqQ0KxI3DrXNsbzoga29uZcSNbsSbLCBQbGF0bsOhIGtvcGllIGlkZW50aXR5Og0K
DQpTIMO6Y3RvdSBWw6HFoS4NCkJhcnJpc3RlciBMdWlzIEZlcm7DoW5kZXogR29kYXJkIChFc3Ep
DQo=
