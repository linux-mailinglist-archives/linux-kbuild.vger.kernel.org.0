Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790F23929F
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2019 18:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730935AbfFGQ6q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Jun 2019 12:58:46 -0400
Received: from mail-qk1-f181.google.com ([209.85.222.181]:42840 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729241AbfFGQ6q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Jun 2019 12:58:46 -0400
Received: by mail-qk1-f181.google.com with SMTP id b18so1670899qkc.9
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Jun 2019 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=QHKISAQKQV4lsrISY+PtbOEajyfUZ1KupWxaMOs3Ok8=;
        b=ks0sk5S8s3YFnI3lYEoqMQSlgmP3PQXaGpO+L7MbjwThFo6D5WUTGDNezkamYpf1hx
         H1gJDPvgZGNEH53FclJ06+XCvjZt5w2bRVnKZArGefPoaFlSxYxBNOmvimfNBxi9JE3f
         SifcPzFUIMsuW+q065nM5jkQ67et9RcRDfiaxvgFxMwFcOM3ZAjF1Rm1QApx5vEXeeBt
         mf94DIEcMUtlosQ7AV/TNNR8SbGy0jxvznOqikSCCKAofeAVkSPit/f+PvvWtGi0I43G
         LFq/XEQRCMY/R/M5ltiiX7DwLq3h8mlWqc8cUDBuZjOb2KwqaKJ9typIpqVMrvM8gFDu
         5M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QHKISAQKQV4lsrISY+PtbOEajyfUZ1KupWxaMOs3Ok8=;
        b=Bwpg9dzt8J3z3dAm4aD5vLucCQe3Y4HXmjzGZxuseXfqozPnTcDbkFiWtEjYRIsbb/
         6neuwcQfrfzv9tgYl+3/SYkzdDSMMv/zHK/AUcNZsu9EjA+8wigyQe4MPSSWejk700tf
         ZiOSIrzy6qraUgXdYmVS/6F1LWscEBroAn+wKfzXOS/mmrt4gtPUAI3ekV7TXREJXRvN
         eAUPwqdehcMVTD9M15ny16GX/fI3uJj+ANZ5vCwgfebm7CgnHgSAbgwleBYug0kbymln
         4ZlRiQTmKCd+hBdalJfgOq5/8LbrOG9b0L5ycI4/0zN2j7qCxEvQaArLax/zyvFzqF/H
         nJ6g==
X-Gm-Message-State: APjAAAUjAW3wu0VeKW6EeBzUVewSMsrgMZlhXaEv+1ILrSZSjQG245Ah
        CLgwyVmS2cUbvRTKW9r6kZCx7pK5mNKONIX7qfq8W2pE
X-Google-Smtp-Source: APXvYqz+t405n4gUtFF2986Kz5P7vGENQHnQh6vNEo1Lb5aDPUVcMqdgQRp4fWh/Xm4QEdK49r64sfCWyMJSWQ48BB0=
X-Received: by 2002:ae9:e608:: with SMTP id z8mr36190793qkf.182.1559926725036;
 Fri, 07 Jun 2019 09:58:45 -0700 (PDT)
MIME-Version: 1.0
From:   Derrick McKee <derrick.mckee@gmail.com>
Date:   Fri, 7 Jun 2019 12:58:33 -0400
Message-ID: <CAJoBWHw2yPgT_25UVF_3tTx6_FfZMBbDqVW5TASb4aPu2JKHZg@mail.gmail.com>
Subject: Adding new build target
To:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi all,

Now that the kernel can be built with clang, I'd like to implement a
new build target to generate LLVM bytecode for all C source files
involved for a specific build configuration.  I am thinking that this
should be very simple if I know the make variables that captures the
needed information.  Specifically, I think I just need to perform the
following command for all C files:

clang -emit-llvm -c <appropriate CFLAGS and include paths> <source
file> -o <corresponding object file location>.bc

My problem is that I don't know how to get the info in the brackets,
but I am thinking that I should make a new build target `bytecode`.
Any help would be appreciated.  Thanks.

Derrick McKee
