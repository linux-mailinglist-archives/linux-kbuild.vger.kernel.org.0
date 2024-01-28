Return-Path: <linux-kbuild+bounces-704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D392F83F93C
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 19:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B6F11C20FF2
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 18:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB591DFC4;
	Sun, 28 Jan 2024 18:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HV/ZzreW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A72C2E65B
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 18:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706468023; cv=none; b=REyliVQ/uJYO57BW1CmFSA13bmfI66fB8BOM2SDNK0LGZt3u7NVejoZJsg0VbRUjlfn2X0ku6+rWuSlXlKluroSg6uXS4lFm8iXBoL3i+RIzRxMGUldO0usrgPSr7XlJOEDJMm389JBJPniv1BbxJy9z2GjSxbxuhj8T6DI/HRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706468023; c=relaxed/simple;
	bh=xDlzODBv1f/hA4eyXs+mhtp2noSpDNDcZFNXIKGat4M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dE0EvucswQXiK9zNPK32/x36U/JSezDSupKX5MkVAF3bKp1aG2rlZhUtRM4VimKRlOTQ0l6HgTVJOcBP7pVcmm9SqGc6j1+vdiq2wzMlYW5ofDOXt19wu5qyUgOXhK8RQHh/tkC4nhje/s7cxnj5kSnfP5fHozI8OrK82NeH7n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HV/ZzreW; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42a029c8e76so17914661cf.2
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 10:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706468020; x=1707072820; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=itu+Wi2kAneNdU86VddtDEBebX52rnKhGPfJsyc6SbI=;
        b=HV/ZzreWy8aeOKC6NQDvymRQVswLfjCfwobOQP446Ybfgs25/OoLulExC41Hn1rjg7
         zms37SONuI1ykcJiw6X6zVMdhnf0M7cABIxaarvTxhjXRWmLsSbM69krUnMRtTXlcG+D
         ngyVwthbMKEK5sCz0CVaUrmbD+DeX1AFPXUBtezT4bOtAk9OUykWVlyP/7xsQd/0yctk
         gGo1KwPyBfHhWb4IN0YI/3+clptFZihjez6ABuYspHujJE+GyUZlPmyIVvFmS03TCpMv
         zHIKKFqbNmA7CmE2GpQGOgcsgl+0r0qUT0xHegVooeDYZjJ9JgfG5Z2/YEWOM0EbigtZ
         zXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706468020; x=1707072820;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itu+Wi2kAneNdU86VddtDEBebX52rnKhGPfJsyc6SbI=;
        b=nWfnldWe7Yg+r00FAXaIDK3nXC8IjLfU//athGpjWA5RIFrdZU6OO9A4e8Tiu+FZdF
         bmWYGSDEb6o7j3bjxv9eD7BxFs27eZ98TdH3dQIKLJSz5Fw+pxodAXwT+0oScarvKKZX
         1YeMKFJod9mjF50USOg+fo90vOuQ4bfiZzlq2I9FPSHi4JThyTnOgxcZcVmE3bCVvXeb
         c56sIorLoC+z3cK5MdndH/pg73AiG15eNROw61u1h9mvV8+I5INlOhplLOJu/cKsFSxp
         Dxz7+GkJ5e+9Ry9b5T15/Xr/vS6l7S57FdSESBcgh457OBvgIhydoNqasWxSAYQgMYHs
         FFaA==
X-Gm-Message-State: AOJu0YykUNTnjdO2ob8APm/AShlhjlDpwoxct9zQ6VFFVQbpcoHwEeX1
	i7rAhne/JlpoNpN8OP3Xn/WcuUFoQ6DovKrdttwp96KQe7p9hVi4QO13eVDN4An3IplkWeKD6ge
	/G3t2Y0ug9Xh31Aed6UdBgP6BLJ1hwDmwnZg=
X-Google-Smtp-Source: AGHT+IE+Nb9Vc/wmlzl+/6oSuWwEJlL06wW8EKpfFqnxxrALG8PMwrtgAiL8C5KZZ5aOS1y94Bv3oJ/97ZVJPAtPfjE=
X-Received: by 2002:a05:622a:19a6:b0:42a:9d8e:49e4 with SMTP id
 u38-20020a05622a19a600b0042a9d8e49e4mr2290946qtc.136.1706468020384; Sun, 28
 Jan 2024 10:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "David F." <df7729@gmail.com>
Date: Sun, 28 Jan 2024 10:53:29 -0800
Message-ID: <CAGRSmLtpLcTEyUgX_nJx=KpNM5mAjvfTfHFmFLiNYheCS71JdA@mail.gmail.com>
Subject: Changes to kbuild in 6.? causing .cpp build issues...
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

I've been building an out-of-tree linux kernel module that has a .cpp
module (plus a library that is built) for well over a decade using the
basic method outlined at https://github.com/veltzer/kcpp.   There was
a patch needed (provided here) in the 5.x version to be able to link
to the .a file generated.  That patch I've been able to modify as
slight changes occured, but now in 6.6.14 things have changed a lot,
I'm not sure if I'll need something like it to get to the final link
but I don't think I'm at that point yet.

My main issue now is this:

LD [M]  /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.o
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

