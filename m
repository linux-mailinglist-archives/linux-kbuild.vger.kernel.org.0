Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1AA139C1
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2019 14:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfEDM0X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 May 2019 08:26:23 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:40122 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfEDM0X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 May 2019 08:26:23 -0400
Received: by mail-ot1-f42.google.com with SMTP id w6so7666751otl.7;
        Sat, 04 May 2019 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=k+CZPzYP3Yyswg9oTnF6oEFTU7iNfbsaWXChU/S/CYg=;
        b=CIoA2EZZV5PVoJ9eIUXQxN05vDxkAcRgRBn+HfqvHwqS1+NaNPi2PBfV5Dy6sxKTzg
         D3zqOm8uJ4mK98RfqDDTr/ZrvqVR/P7PkqXY9bj2AFsbkpLJYi+o1SwTdToKV1U4DIXM
         0WR8bbXLwSGEDSYArSV9kEax4+Fr6cfH6FsZGxh1HQdd2Mf8Npz4X1YXgPRCq2YXXRT6
         Eb854qd6snAgJsyiZxi1Er6hsuD28fWGtERL+Y5FzU9gI8OYdTWYLuUG4DzLUZFXBebC
         zZMV1qTqWDFgnRiHdxBt+wNITCX3iETNlQ+OH92eaKceTpr8+sQNknwPcPiky9YW1of7
         w8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=k+CZPzYP3Yyswg9oTnF6oEFTU7iNfbsaWXChU/S/CYg=;
        b=CCISbr+osc9AeKe+pc8qbN8hxEsti0iXUUSyjwn5YKL5BNhIsj2N8aN3BhYmPOOajG
         Y0DHkYr+LkS0x2TWdtOJpXjZ+ULB7juefIgIfjsJeAjddp5oUkY3ppTWwHjAp4hKw6+y
         q6QPjDakuUo+WBNsFygYiL7hodN5rKQviyICaOoJczA+wJlPSzGUnGEPpoCYQ+PNZs9t
         nAC1O22nFLwcIFJOdkw6Pc9jfnQHsf2m/vGlsX9sd8dQPYpD33qQSjSndhRrjJhF32Xi
         DmgWD2Bi5YmHO0o25bw37iQa9yCjUC+Wu50n2lubdhchz6MFRsVTk/fvEOkw4yJOpLd+
         3dFQ==
X-Gm-Message-State: APjAAAUzyXSBZYvN6aKIWiLHMXgcEnUogk5QnaF9snmWg372doRZDqhr
        2gMNpHalaINEGyZTy78AdrkQvKCB+gAluU6U0QRjz2Zp
X-Google-Smtp-Source: APXvYqx4sIJLThGU9uzZ/Rr2Gk4H83M6bptFgzXpJGA0J9K8RmDRCskZ1kHf6JVQ0hQ1yxbAio25kXGYBDdtWpENCVk=
X-Received: by 2002:a9d:6b82:: with SMTP id b2mr2580468otq.232.1556972782477;
 Sat, 04 May 2019 05:26:22 -0700 (PDT)
MIME-Version: 1.0
From:   Ulf Magnusson <ulfalizer@gmail.com>
Date:   Sat, 4 May 2019 14:26:11 +0200
Message-ID: <CAFkk2KR+of+7YZKC=LOn1J7q8_u5b8HyM6yh4Ynfh68jYW7X8w@mail.gmail.com>
Subject: [ANNOUNCE] Kconfiglib GUI menuconfig
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

Kconfiglib (https://github.com/ulfalizer/Kconfiglib) now has a
Tkinter-based guiconfig.py in addition to the curses-based
menuconfig.py. It has been tested on Linux, Windows, and macOS.

See https://github.com/ulfalizer/Kconfiglib#menuconfig-interfaces for
a screenshot (with show-all mode on). The interface is inspired by
qconfig.

The images come from data embedded directly in guiconfig.py by
default, to avoid having to carry around a bunch of separate .gif
files.

makefile.patch now has a new 'guiconfig' target for trying out the GUI
menuconfig on the Linux kernel. Python 2 is used by default. Run 'make
PYTHONCMD=python3 guiconfig' to use Python 3.

Please tell me if you try it out and spot any issues or annoyances. :)

Cheers,
Ulf
