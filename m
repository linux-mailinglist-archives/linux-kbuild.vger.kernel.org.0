Return-Path: <linux-kbuild+bounces-9401-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F700C3297A
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 19:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 459D14EB186
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 18:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA27F33EAEB;
	Tue,  4 Nov 2025 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="0Cs2pGYv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4403A342C93
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Nov 2025 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279960; cv=none; b=esij4gPWo8BObbfNN0/0NOCrvGBXsQsxz6fUtO30w6Yo+j0VII+NcVrl0NLpSdRhJswrBpbpEG2gUupKT+wncqtQo/5w3eE7GIfhmA1swnibmCerQ0LNtODWsL8KcC7vz1RWkGzCbSyEXQqXD3ChLeZzF5nVaNyr6XuiWTMSTx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279960; c=relaxed/simple;
	bh=m1uwxnIQgDEvoGlGJEV2cdGCHNy/Jt3/XLouPoDvnzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GttEBsGrymNsyAzhlkz2Krl9oz7XNed77eBBFV/pM+7vl9IQ8hhBXOkVYSHUiErjQRd1Op985EaTbVEqUnZebzjHj9gUjrInZZ2XHHQYfVVfp5lO9BFbF3Yd07vvzkKR8fd++PO/TgOn4ONmWhbqGnuM/jOloQKZAbv2IS/mWC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=0Cs2pGYv; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b87171370b5so815709a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Nov 2025 10:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1762279958; x=1762884758; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fXMTm+VYzAvY0dzLHfbkpTMRVQ9wHEDxxkapIdIQmk4=;
        b=0Cs2pGYvCe+TXrnys5A7s1RaIOoTeFfpuJFTfj8UdHKz5yzUx+BNmxzdTeVNyNrebx
         Iyy+ygdOjgnVvLIFuMUx2UFBg3DiUve5ObJC3nl8K4wdssDL2+b/wjy+b+yPlo8hKAab
         49AVFhjbZTxOowingm7vuIC/HXxByzOjHOZ5Rqx3bjegKxGQ2SfuXy9x7+crmla2Yx2Y
         a0PITAgVL2WAm/1sYhfALC+TLgO/zubvZzdsGKIIgW9/ZHDH5YrMn61Xt9QY5IQgPCQE
         cCDs55lGWqvJU1H0E0oTVS0SNFu4LCrnPY4eUAYV23tgw9lRHJOecLWSC7x4WuGsSyF9
         ZVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279958; x=1762884758;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXMTm+VYzAvY0dzLHfbkpTMRVQ9wHEDxxkapIdIQmk4=;
        b=XAGgH7sQ+XN7wr+b5Q0BT5/9nVane/TX0wE6FGFwmYKvp8h8E+m6vuLEK6ir50BM8c
         CGUr3FayAuyUdQWA0Z4NjxKJjs01KggoQUmIL1jPwrNTMtm0qcptAyJdpphJxXnLl9iP
         M9+SX2xqpTaNlzPaW5dx4rFL+cn4CX6BJU/ltfMbfmjyPlaS+UD5ldmzMem1V8a5UOH7
         RoxmPZGbcI/y7LQA3vUCFY6L2uItgwEqDJXbOB3nE/yaiMcBl5C1raRc6Nz5Eq04z/c+
         gOBqDyabX518o0qDTR6P4jTDHTKnlDV4iOjrQd1AAleuFaVWkdnrZXt5kqT2fC3kkKD8
         N4Jw==
X-Gm-Message-State: AOJu0Yzy8SuwuYVmgUYw/aWnI5Y1kIKR6F48YUbX9mZhXZR6crF+y0/K
	tr3MjvA5Qj05uoOuxM4BrQp2qodGmQp4aM1WanZcBKHSyRRINukkVc1XelW/1FlmluVSgab3l2h
	p9ORA
X-Gm-Gg: ASbGnctcu85sbzwa9Zit0/BNjsn8O9cKWmjsVwJS2RHn6AokfOJYdbAK12rtQFnc3Ht
	N4bVM+kPWDlwTKbgl4E9LKlv/qvyX+FkZeyZRH6YD2euEoYB6cooestBT9Jng9nqrmzxx+ndZ9W
	LpMuPSlZ4/cuV4BF4IAEFt5iyol93X5FurmF4ynEvTNyHyPBzlqhJ0CaxaZemyuIwDsymohO0fm
	RZSLULnmbWGoFlymImi5YDHw0kAPLsozXxSSogphLgQhQF0WWjzCpVMYCycc4DeeGpeIveoW8MK
	wsHDYFGICmMmsah5c7XjVpRWXtHh+JEw1U+slWGcxe4GjpOrLbv4tU3Dn97UBJ9jIXDXop7MJRl
	eIFCSPOcbDpJb2FtBaSYdniB7+GriNDruZ5/k+E7rkyftJUPFcwwtGYvFyQ==
X-Google-Smtp-Source: AGHT+IEfMevdEiMdqDvcfkgPhov93sowDZtb/5DAGljcPm4WdOYVS1DF54t90hQB/DDdvYdf8wD0vg==
X-Received: by 2002:a05:6a20:12c3:b0:342:8c38:ed0 with SMTP id adf61e73a8af0-34f87106a7cmr92855637.8.1762279958021;
        Tue, 04 Nov 2025 10:12:38 -0800 (PST)
Received: from telecaster ([2620:10d:c090:400::5:5bc5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f87a6155sm3008088a12.29.2025.11.04.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:12:37 -0800 (PST)
Date: Tue, 4 Nov 2025 10:12:35 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-kbuild@vger.kernel.org, nathan@kernel.org,
	dimitri.ledkov@surgut.co.uk
Cc: Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <aQpCE_XTU-bZHFbk@telecaster>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>

On Tue, Nov 04, 2025 at 04:54:38PM +0530, Venkat Rao Bagalkote wrote:
> 
> On 04/11/25 4:47 pm, Samir M wrote:
> > Hello,
> > 
> > 
> > I am observing below error while running the make modules_install
> > command on latest mainline kernel on IBM Power11 server.
> > 
> > 
> > Error:
> > DEPMOD  /lib/modules/6.18.0-rc4 depmod: ERROR: kmod_builtin_iter_next:
> > unexpected string without modname prefix
> > 
> 
> IBM CI has also reported this error.
> 
> 
> Error:
> 
> 
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
>   INSTALL /boot
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
> 
> 
> Git bisect is pointing to below commit as first bad commit.
> 
> 
> d50f21091358b2b29dc06c2061106cdb0f030d03 is the first bad commit
> commit d50f21091358b2b29dc06c2061106cdb0f030d03
> Author: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> Date:   Sun Oct 26 20:21:00 2025 +0000
> 
>     kbuild: align modinfo section for Secureboot Authenticode EDK2 compat
> 
>     Previously linker scripts would always generate vmlinuz that has
> sections
>     aligned. And thus padded (correct Authenticode calculation) and unpadded
>     calculation would be same. As in https://github.com/rhboot/pesign
> userspace
>     tool would produce the same authenticode digest for both of the
> following
>     commands:
> 
>         pesign --padding --hash --in ./arch/x86_64/boot/bzImage
>         pesign --nopadding --hash --in ./arch/x86_64/boot/bzImage
> 
>     The commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
>     vmlinux.unstripped") added .modinfo section of variable length.
> Depending
>     on kernel configuration it may or may not be aligned.
> 
>     All userspace signing tooling correctly pads such section to calculation
>     spec compliant authenticode digest.
> 
>     However, if bzImage is not further processed and is attempted to be
> loaded
>     directly by EDK2 firmware, it calculates unpadded Authenticode digest
> and
>     fails to correct accept/reject such kernel builds even when propoer
>     Authenticode values are enrolled in db/dbx. One can say EDK2 requires
>     aligned/padded kernels in Secureboot.
> 
>     Thus add ALIGN(8) to the .modinfo section, to esure kernels irrespective
> of
>     modinfo contents can be loaded by all existing EDK2 firmware builds.
> 
>     Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in
> vmlinux.unstripped")
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
>     Link:
> https://patch.msgid.link/20251026202100.679989-1-dimitri.ledkov@surgut.co.uk
>     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
>  include/asm-generic/vmlinux.lds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

drgn's CI hit this same failure. FWIW, the commit fixed by this bisected
commit, 3e86e4d74c04 ("kbuild: keep .modinfo section in
vmlinux.unstripped"), also results in ELF segments of size 0 in vmlinux
for some configurations, which confused drgn until I added a workaround
(https://github.com/osandov/drgn/commit/2a9053de8796af866fd720a3c8c23013595d391a).
So there's some funkiness in this area.

Thanks,
Omar

