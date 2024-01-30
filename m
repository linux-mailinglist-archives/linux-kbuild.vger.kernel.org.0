Return-Path: <linux-kbuild+bounces-722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C034841BFB
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 07:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B079A28303F
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 06:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F4F4C61;
	Tue, 30 Jan 2024 06:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqXc6yBU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CCF38F84
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 06:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706596345; cv=none; b=hMA9o78ss5KcYWkjZIFPARjyYo/iFm3DTbu23nt1H7Dt0zmUmOIqpkLK73rzk49fJgXLfOh4pUP31XbgfLFX3snbSWXFVhXbXXqZL6LkmV76Madiy4wMMYmf3755M+BF/V1qzW1s6tMhNLCaCbR1RfyXM89iuPM42DSxWOjjIZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706596345; c=relaxed/simple;
	bh=LtO3rThxEgxCkuczFiZbvw9grICIpR/W68nfY9815y4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=DN6214WMJ440hfZMxQceLnTiGzJIFZlW3oQD54JtVhKfPEagW4UKdp8gckODPiTFLJ3N459YxhvxJxvREIFnKekzbFHrYT5g3OIWA+LAQ19lmmsXejxKMmckUq35zt02i+hr//ZPS9aCGDqXhHZGZIDQA85gjOPballGUuTNczE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqXc6yBU; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-783d8dff637so271943385a.3
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 22:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706596343; x=1707201143; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SOF1PtMAfBUvzyqpL6NmiUAjXBahqHoFt7FzwbnAPjg=;
        b=gqXc6yBU2MOnYEmZE+rLArky6b7HYZBrZAI87vqqwfac+jZ2o1dtTbdDCSZ+1qvsU/
         lSxApSLO1pSkq/j8nQc646WbEgxMuwHpKbh/vhsiYkdLoY+yFpDmtE0xnhtGeOCC+nbi
         au4yMcnAE/2LjbtTUzQaGXhMoDEIehMfjfb2ZPdTd2mHbR1z5b5e9DTo9TjVQIEmpZbj
         0uXnbr5XZ9DlkE7UiYZfLOAiLyfObXHDZsh69btOaP4/EzFu6tpLT+pzOW81/m5TBVuC
         QpvSNXIHRbtTzG8Fn/qveRRv+ucWIqCheF+wmrEp1QWdqq1Faa2UF0t+B/NZdDKfHJhn
         VpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706596343; x=1707201143;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOF1PtMAfBUvzyqpL6NmiUAjXBahqHoFt7FzwbnAPjg=;
        b=MmOIafbn8hL9SwhO60NpKiAAaAuMkd+m837wLBBJ6O1l4IhbGno1Zzard/DahIYane
         BStL44W+V8K9UyqQxIDjZRsapOQ93QPE6p7znxezZw17U9uYha2Uck5Y02jMiQT81HNT
         HWlSFsciGPuTRXpSOvdKqiDVWCXxaGTJvoLEJJGGEsXHD/XXEDyXZAZ60Gy+X/vKzdua
         /o4ENDL4nAUeVTOqOWmQgpNcfoSxARiZIS9Oe64CnAjB7pMg19PAUUnWnHO46BOQBiPh
         sCau/2OJ2rcWGlYy+wTg+SeQ4hO6bo6Tgc52/uuRzSt99J6gTzCYl620IyKu11B+e6dr
         x0SA==
X-Gm-Message-State: AOJu0YxdbAds8D0krmtpSWE/Qpf7CyigEoUc62VvHTc+5xuslHfpxaoK
	AR40pVBhiMYuV73xJSHKPCAR4iZsNvANn9f1UGWewVb55ZzKkz4UZ9NW5YuDOGAZyY9t4Z1+azV
	p24eZvnTcIAKEYuhBsBsaedgdUlztziX8PzI=
X-Google-Smtp-Source: AGHT+IHMHi7b9BmChE2hC+8hcLgLdOjs9xXQB9bMAT11oQsOcFYQPZZsgbx1F9NE42+uLT42qWctEJbMOa0zkBfhxkE=
X-Received: by 2002:a05:622a:452:b0:42a:8723:6bc8 with SMTP id
 o18-20020a05622a045200b0042a87236bc8mr8200498qtx.90.1706596342671; Mon, 29
 Jan 2024 22:32:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "David F." <df7729@gmail.com>
Date: Mon, 29 Jan 2024 22:32:11 -0800
Message-ID: <CAGRSmLshjakU3pXu_odd1-et2KfOUrhTruRcRBP=T-dhnYRVzg@mail.gmail.com>
Subject: Changes to kbuild in 6.x causing cpp build issues.
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

resending this because it doesn't show that it made it to the archives.

I've been building an out-of-tree linux kernel module that has a .cpp
module (plus a library that is built) for well over a decade using the
basic method outlined at https://github.com/veltzer/kcpp.   There was
a patch needed (provided here) in the 5.x version to be able to link
to the .a file generated.  That patch I've been able to modify as
slight changes occured, but now in 6.6.14 things have changed a lot,
I'm not sure if I'll need something like it to get to the final link
but I don't think I'm at that point yet.

My main issue now is this:

LD [M]  /media/sf_SRC_DRIVE/mymodule/l
inux/driver/6.6.14-686-mine/mymodule.o
  ld -m elf_i386 -z noexecstack   -r -o
/media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.o
@/media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.mod
# cmd_modules_order
/media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.order
  {   echo /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.o;
:; } > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.order
sh ./scripts/modules-check.sh
/media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.order
make -f ./scripts/Makefile.modpost
# MODPOST /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/Module.symvers
   scripts/mod/modpost -M -m       -o
/media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/Module.symvers
-T /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.order
-i Module.symvers -e
/media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/.mymodulelindrivercpp.o.cmd:
No such file or directory

It has never built a *.o.cmd file for the .cpp module and still
doesn't, but the new system is looking for it.    Could someone
familiar with kbuild tell me what I can patch / do to allow the system
to complete the build like it used to?

Thank You.

