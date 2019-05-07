Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B604515B9D
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2019 07:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfEGF4J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 May 2019 01:56:09 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:46431 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfEGF4I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 May 2019 01:56:08 -0400
Received: by mail-qt1-f171.google.com with SMTP id i31so17650777qti.13
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2019 22:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yKhhcLJ3T7kVOpa8s21MURvzs27DTYas4h49s84mXqE=;
        b=m55Ban2MbLRlcogeHAgKHxTbo/pUTk7X4yRT/leyFstTLQOo2KNEsBu9ydOBtifEv5
         NlL4ydH6YeYjMg1oYRrAkuQJEi3oIRwaqmH88Zf8M/x1nb2uOWx+fdZcni/bLA41UY0G
         iQah3sQTwaaRPFYSZdONwsMCXZw7qarLlFPr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yKhhcLJ3T7kVOpa8s21MURvzs27DTYas4h49s84mXqE=;
        b=o3L2+xbSnTh98h2X4nuxjRHcTZn6XOqTOeLVjqdp+r2DtHSIovZWIAOxfll+wDV6N/
         C0hDttid2rvrplPY7CZ55cYwn+6YCpTHXdlFoSx8yITRw9Q5pzY0aL+Duz9/gs+jY0W8
         d6+U1MHcNNQlATWIsX+pCvDpgTGOQpKuATB4IOHZ4vDFi0eaT32utGTYaQVX/F4VaS2J
         mcsivwQHj81BoccKW2pgfP0l6IZMZKHx5PJJ/E+figrvd3lekODDlUhjXHt2B/xTNlzr
         dXExPlz9+XaXdmeBRLj/dmkc1xsZdBjPuuYniyofhXfKiFC1fpwVAc5V1YgnhJ9vGPvE
         YSAA==
X-Gm-Message-State: APjAAAUvxI9fi4SoKxcL6ugT/qG4WAD3BO1a8hpVBr01cfWTS71+KRCl
        i9+S7q26ksR+dil3TPbUFFzXRR49tUIP8i3ULP8PFeN1brc=
X-Google-Smtp-Source: APXvYqw+RL5odwfeyYuZ0pkkhik9A1G/pWF8qcg4Upvoriba4uCisv4Eh0oK1ERo3uwk8GkVZ1uI4zlkain82ONBLas=
X-Received: by 2002:ac8:2d48:: with SMTP id o8mr24769882qta.136.1557208566157;
 Mon, 06 May 2019 22:56:06 -0700 (PDT)
MIME-Version: 1.0
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 7 May 2019 05:55:55 +0000
Message-ID: <CACPK8XemTPvV9KTuMDXew3vxzOw=A2Cj-ToVpe=ZSjrrYC-XRQ@mail.gmail.com>
Subject: Error message when compiler not present
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Christophe LEROY <christophe.leroy@c-s.fr>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

The other day I was attempting a kernel build and stumbled across this:

$ CROSS_COMPILE=foo make
/bin/sh: 1: foogcc: not found
make: foogcc: Command not found
/bin/sh: 1: foogcc: not found
/bin/sh: 1: foogcc: not found
scripts/kconfig/conf  --syncconfig Kconfig
./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
./scripts/clang-version.sh: 11: ./scripts/clang-version.sh: foogcc: not found
./scripts/gcc-plugin.sh: 11: ./scripts/gcc-plugin.sh: foogcc: not found
init/Kconfig:16:warning: 'GCC_VERSION': number is invalid
/bin/sh: 1: foogcc: not found
make: foogcc: Command not found
Compiler lacks asm-goto support.
make: *** [arch/x86/Makefile:302: checkbin] Error 1

I had something more sensible for CROSS_COMPILE, but the point is it
did not exist in my $PATH.

I tried the patch below but there's still something calling the
$(CROSS_COMPILE)gcc before gcc-version:

$ CROSS_COMPILE=foo  make
/bin/sh: 1: foogcc: not found
make: foogcc: Command not found
Compiler lacks asm-goto support.

This isn't a big deal but if there's a simple fix it would be nice to clean up.

Cheers,

Joel

--- a/scripts/gcc-version.sh
+++ b/scripts/gcc-version.sh
@@ -8,6 +8,11 @@

 compiler="$*"

+if [ -x "command -v ${#compiler}" ]; then
+       echo "Error: Compiler not found." >&2
+       exit 1
+fi
+
 if [ ${#compiler} -eq 0 ]; then
        echo "Error: No compiler specified." >&2
        printf "Usage:\n\t$0 <gcc-command>\n" >&2
