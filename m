Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF352338BE
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jul 2020 21:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730507AbgG3TLm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jul 2020 15:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730488AbgG3TLm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jul 2020 15:11:42 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07325C061574;
        Thu, 30 Jul 2020 12:11:42 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k1so5044254pjt.5;
        Thu, 30 Jul 2020 12:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2qrM1HvX0q0CDfLlkMQtnEdV4MfzTfdneBe5DtTAa1M=;
        b=se+kmvyqv/0yBAoSxgdaaFmZtUjRhQ+tp1A3dml97ntARklAYnFwYx9gM7AMfj5wVW
         9yJLnRnfCtftCWUbFWLgnx8VNH+HC2BCDisouyEirG1FclBiozhZMN3JllkHhCnKTiob
         somDNAKbzeWyVlNpwdY3OvOdKDfCNW6sWuW785/tPoarljl3QZZJXnEGKVOSnYY02MFH
         91fg3CNSFvFMfeiv8RZxhOJZMlz+7TWt0NZnVuiqwi7+pAJ+r390AWvBnkuZuLXydDno
         J14m+CyG0JqBBNSA0EVIxrXDX4Ujg5fgl0PG+WzPFIs49/R/6raWEjoGU024/HY8nrZX
         krAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2qrM1HvX0q0CDfLlkMQtnEdV4MfzTfdneBe5DtTAa1M=;
        b=b37CuJlEPjxghfVtvConHIl7Z8seEkKKdcIpJb+1VsfZxrMT8V0oYz5eiyz9doR796
         wMWb2lh31MNQtmhNRfl0Vj9r2dthdCaV1V1zxjKgtZzBo4u8zbcOzHuG60L8xwx63m0U
         IJCnvq3V0v9viFpf8zObC7QXlryOFyNlBycwn7fkvG2klYSwgFumDQjnxSCF+Tz5DkaU
         fc/jZwg0hINQH+D1Cr59TXp3wctBvChfXxWKfsEmWaslg6FiyS52XDMAde1c+v1GM2IH
         Y3FdEzl0tl4Ll8wYeEWSozyuM8WA8ELNkqFltAO7cLyKG3Lb8E3+vShfFQ6WqIFUJXR/
         q2kA==
X-Gm-Message-State: AOAM530YIxRrPKjRXtGp4cIDEPgRRtSyGTzFYznboPyDHZDYADXvHawY
        29KPa8HAaS6NU2t0yfT00tk=
X-Google-Smtp-Source: ABdhPJyw/p/oqLAHCYYpuecDmhxocUWLlJApao4mjZexeaT+ADb3kgXNASVpphJLSL9aEks8cZbr6g==
X-Received: by 2002:a63:4b1d:: with SMTP id y29mr362889pga.264.1596136301573;
        Thu, 30 Jul 2020 12:11:41 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id o22sm8644976pfu.206.2020.07.30.12.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:11:40 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v10 8/8] Documentation: dontdiff: Add zstd compressed files
Date:   Thu, 30 Jul 2020 12:08:41 -0700
Message-Id: <20200730190841.2071656-9-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730190841.2071656-1-nickrterrell@gmail.com>
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably
more will come, thus let's be consistent with all other compressors.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 Documentation/dontdiff | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index ef9519c32c55..e361fc95ca29 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -55,6 +55,7 @@
 *.ver
 *.xml
 *.xz
+*.zst
 *_MODULES
 *_vga16.c
 *~
-- 
2.27.0

