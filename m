Return-Path: <linux-kbuild+bounces-6505-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83474A7F63C
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 09:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74FA0188B683
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 07:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAEA2248AE;
	Tue,  8 Apr 2025 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aJs7kKSl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DB10E0
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Apr 2025 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097338; cv=none; b=MY3DgiFu3KAmhZvJCujhygqI42gS1NS1EJToNayolssMy7uf6zKHKvEWwPEUHzmUvft6W4MOWUwe1pR53CCtwLYFL35WBeQ5007N8Ml7SuyFsuPVL+8BWc8DkFeQjiI/FGB7sF5KHQxp6NkGI+xHl935HjGGRdm8S02bFNrCpXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097338; c=relaxed/simple;
	bh=Pn0FY6CElyCYc5B9NO953XBLE4Mc/rR+/JOccRSUwKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NIG9EelDogTv1RVAc1ygDPMAti5zCzkJSaIvOA7LN1ysyoqGPk2czGMc+XuFXt8dzDdOYYVwEI/F45HZt3WUh+nS99t9xH03w4KnkRdc7NGRicx3esZkHyGypEzF1lVmsQlP2NifnTTp2jTM3J9V0PMmNp1j1rYg4vJTyxHTanI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aJs7kKSl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2824419f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Apr 2025 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744097335; x=1744702135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0cTQmfSj1JKjmotOYm2ZctqRJNrdyoR/IHdMM1ZjqE=;
        b=aJs7kKSlr5LcGrLZFzxWW+O9pACPwPD27FtPUt2syJC7m8pG1EdU09UjBSwyYMzZDD
         BzRT5cqPxbvIwPM/vAKTuEeAY31geaLMKmjohUG6DHh7E7z6c9ghvzL8T4mub9TP3LQ9
         e4aRIqhQfnbeX4trQAu/XWW6G0tatOJdBtDHhE7TtVtqsqMT/71tl9G0tiBLGCZFtio0
         rz51750qAcgBqurs4eh8zUcOtJa14pjkopYzyuYqwm+b9aReTNzlXZOWYlHFzeD2JVYc
         6fFSPd0NEdoxkoaj4uHFXMuCc/wtgYkKal2Fuc68UVZU5E8O+izoxQ/4EEFTu50mglDf
         aV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097335; x=1744702135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0cTQmfSj1JKjmotOYm2ZctqRJNrdyoR/IHdMM1ZjqE=;
        b=qaiQEoM8lXDeHv7FckX+hBntHXWX83az5+Q6PphkOAI598tJWGQRNOjCfGrXDVZGwA
         +u56r5XZ6gjLzzTMahtHe6z5y9EIsydO8O2cx5QbF20CcO3ta2YAFopf+L6cxAVAAgQY
         v2t+KHuqNnhOCEudHbX2z/Q5e8tcb5MDLuzitatVfc6d93jjs2Ugpe2eAihBqDOBrA0P
         aA5+6tIP/kTJk0iFq0RJVPPXhKnC8ZbelXbJNueDdrUVrSAqRsLKPX5aAqCt1keZ8JOU
         sy1mNE1LtuFPlOVgFWwagZPQbhdJtJsn5sUIEIB9o45Y30ZNvjMI+6RerJvUPcAKkleI
         y6dw==
X-Forwarded-Encrypted: i=1; AJvYcCX7V9hEzy6u2w6X3AqWdbnNbx4xcsJEv3uoDQfN+qMI7Wi+k2tEWFYJkTANLPNAYBbVXgIV1prquVWEROM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysPFk0jMO07bDJQ8jAegbNt0HM9WM6IeLzmL/R1/BBvtxwKOMs
	SGCsjNXuzwvUs8/9IUot09jLVd4cpUt7X5UybUIHcOSuebRrEL8D0Vy0yDnPnko=
X-Gm-Gg: ASbGncsF0lJXyRtsASHvXsOZQ/zSexKkSTBqvz3oLdFsO+9df1ZuymWa6f09I8mpVT+
	Uan8xtUN/ONhrUY2lgxzyW2UfFcYa6q5kFoSwcf/cnYdWdzi1C8K4PibefVL+GavBqOGD5bilQv
	Rl9J0r1kfQ5BrgysmtjE2flAgwOvTDPqqMpsJxO+1jb0fl45BPAIA+3kz9OLiPIcGU9FKsSn94d
	fgnYiwg34KL8bLXjGHyZtwT71KbPNdmOjQ32e2vxQBAmoGlCF3ULROhqaBxmgQ5Iwwd7XiEB9Wd
	S+8OQWFdkxrV7Q4qHD0rxdetbQ9LM734l9phZ/BLZ2Cye5vgvcss3wjVtMaMnZN6Z+14i7k=
X-Google-Smtp-Source: AGHT+IFz/8BWGlvn1oOub9ouIswew5ujgXC35R9BzFfnCHHdvTVfj960TEGZ4R6A4fumlfb695WeYg==
X-Received: by 2002:a05:6000:40da:b0:39c:3122:ad55 with SMTP id ffacd0b85a97d-39cb359703fmr12528490f8f.18.1744097335011;
        Tue, 08 Apr 2025 00:28:55 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:5b46:8918:c917:7872])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226da7sm14444737f8f.98.2025.04.08.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:28:54 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3] scripts: Do not strip .rela.dyn section
Date: Tue,  8 Apr 2025 09:28:51 +0200
Message-Id: <20250408072851.90275-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The .rela.dyn section contains runtime relocations and is only emitted
for a relocatable kernel.

riscv uses this section to relocate the kernel at runtime but that section
is stripped from vmlinux. That prevents kexec to successfully load vmlinux
since it does not contain the relocations info needed.

Fixes: 559d1e45a16d ("riscv: Use --emit-relocs in order to move .rela.dyn in init")
Tested-by: Björn Töpel <bjorn@rivosinc.com>
Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes in v3:
- Rebase on top of 6.15-rc1
- Change the fixes tag

Changes in v2:
- Changelog modification (Ard)
- Remove ARCH_WANTS_RELA_DYN (Ard)

 scripts/Makefile.vmlinux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b0a6cd5b818c..85d60d986401 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -13,7 +13,7 @@ ifdef CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
 vmlinux-final := vmlinux.unstripped
 
 quiet_cmd_strip_relocs = RSTRIP  $@
-      cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $< $@
+      cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!'.rel*.dyn' $< $@
 
 vmlinux: $(vmlinux-final) FORCE
 	$(call if_changed,strip_relocs)
-- 
2.39.2


