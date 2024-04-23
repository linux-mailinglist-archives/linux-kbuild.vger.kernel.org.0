Return-Path: <linux-kbuild+bounces-1673-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9C8AE5E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 14:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03CD52818FE
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 12:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F02984A54;
	Tue, 23 Apr 2024 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="jkwfW46h";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="phFlzY3v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD572E576
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874956; cv=none; b=hn1mehOZApmRECQYBNbwoVKc6oIt5THyNrOEgcW4U4xRNxQnE4GBGuUi3M1uOQAvCt2WdYMsU9Miwd/T0tZoqdl9ejPoRxgSZNs2anuUKi1vQdWywK/3KEHSqPtYmHF/FP7WSx9H/gszV7+Z72bMt8Lv9vGP+ff6aj/K4WBH6Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874956; c=relaxed/simple;
	bh=D4AqC6DJTjx1Mrko30IB8c2166W8GKAXdoU6m7KLIzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fcis+MRXcm+ADyDYVjkKDs2gLFRQ1z+dWvWKWsY4fWdJzxAXL/xZVmdFJih7h6CcUR195z7fMc9mQzpidtbnhbWNp25IBp4Jyc6D3b7JcBoJeCieL69MORC7bnNwHYb2QAF8rXNgD849nRbR8r6gGURkclnvwQS2RNr2ZghVpfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=jkwfW46h; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=phFlzY3v reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1713874952; x=1745410952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E9wZqJ6y59Nv34P4nAdrZa4qU8KTIkboonxhlEkLlm4=;
  b=jkwfW46hXynd+m468Dt5GRupNVMaEat/ohTFeCY7lc97HzmNa5Tswg3l
   23OYX7nogk6g+MDSONA5/6N6267g8szR1xkue/xVlJekkf16FDk5B7Akl
   J8lzLS+ow9W9z0to3iikkPYuZOBlDaJl/2Hw8WAeNGNw/jfQasXFSCY5D
   dwxOeFdAojFkh7TRX/nLZk0RhwN5C/HR8WOoBdF5bp5b+rKIVz9cLogIZ
   s/GloV6VbWqP/7ns/NmZpHY3YTEZ7mHL0WmZT+ztoXWlyXj0GnrS0iAXs
   1w+Gxtf/NwEpbQos8C8fYqDpY6YXugO3LpGGaIt435zi9vfEr2Q9RNL1D
   A==;
X-IronPort-AV: E=Sophos;i="6.07,222,1708383600"; 
   d="scan'208";a="36566806"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 23 Apr 2024 14:22:30 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF7DC161401;
	Tue, 23 Apr 2024 14:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1713874946;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E9wZqJ6y59Nv34P4nAdrZa4qU8KTIkboonxhlEkLlm4=;
	b=phFlzY3vX0KxxBzY1YCwzf1781fBpiOo7/nO59thPz5hSw7TjG48gdi0bfVEr8OsYWdcEy
	qyOMHbssLW04suAHEhuI56UV+2lpjH1sruFLm31ZkBp4DFN7eTJ9dUBsHS60ja9ar8/6Oo
	3yIhJwWLBF06XMa/Sd21JLjzYfWVISG8xbmZGpNY+utA9z6u63zK4EgV2Dj26W6jt2KMOd
	gSt/w97Z6ibQqYRKz9rUsDToWIhK5AHRtYilzXroHTzQfFxZsxxq9sHeMliXxwlzhaX1wa
	aw3WvAldXqJDOT/dQIVAlplCcRtbd2B0jtZycn2uog7lfal8R/czQyRfO3IF8w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [masahiroy-kbuild:kbuild 5/7] kernel/kallsyms.c:181:56: warning: array subscript is outside array bounds
Date: Tue, 23 Apr 2024 14:22:26 +0200
Message-ID: <1887856.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMj1kXH+i1mEFsgZnXokbJ5srDbZY50QGGJcf7yr0w2BowJB8g@mail.gmail.com>
References: <202404231102.r0G0StUJ-lkp@intel.com> <CAMj1kXH+i1mEFsgZnXokbJ5srDbZY50QGGJcf7yr0w2BowJB8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Dienstag, 23. April 2024, 08:57:16 CEST schrieb Ard Biesheuvel:
> On Tue, 23 Apr 2024 at 05:50, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux=
=2Dkbuild.git kbuild
> > head:   8246a1e9b922c0e797ec28d8a602de1384ff8140
> > commit: 0bdad28369fc5e93de39b5046228ed78e982fc71 [5/7] kallsyms: Avoid =
weak references for kallsyms symbols
> > config: i386-randconfig-001-20240423 (https://download.01.org/0day-ci/a=
rchive/20240423/202404231102.r0G0StUJ-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240423/202404231102.r0G0StUJ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202404231102.r0G0StUJ-l=
kp@intel.com/
> >
> > Note: it may well be a FALSE warning. FWIW you are at least aware of it=
 now.
> >
> > All warnings (new ones prefixed by >>):
> >
> >    kernel/kallsyms.c: In function 'get_symbol_pos':
> > >> kernel/kallsyms.c:181:56: warning: array subscript is outside array =
bounds [-Warray-bounds]
> >       return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
> >
>=20
> OK, so weak definitions result in compiler warnings. I don't know
> whether C requires weak definitions of array types are always the same
> size.

It's not just compiler warnings. UBSAN is also triggered by this commit.

> UBSAN: array-index-out-of-bounds in ../kernel/kallsyms.c:181:56
> index 64143 is out of range for type 'int [1]'
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.9.0-rc5-next-20240423+ #2422 =
cee92685fac34b7fb981de78571f7250231badab

[1] might also be affected by this as CONFIG_UBSAN_BOUNDS=3Dy is set.

Best regards,
Alexander

[1] https://lore.kernel.org/linux-kbuild/691143b5-4636-4911-9c93-437b95f461=
57@amd.com/T/#m3e5e9112bac8a56b8a7dfa6a19cbc03dcb43a480

> We could work around this by
> a) emitting the weak definitions into a separate object file, although
> this may still violate C, and does not hide the issue from LTO
> b) go back to using PROVIDE() in the linker scripts
>=20
> @Masahiro: any preference?
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



