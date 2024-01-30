Return-Path: <linux-kbuild+bounces-723-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDE841DF5
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 09:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 256DB1C24A65
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 08:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC7C56B70;
	Tue, 30 Jan 2024 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWjz/ekf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78CE5647A
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706603826; cv=none; b=YytWhp5NIbo99SAl1ZjckyA9z+P5exqC8C36pYOu2lpU+XMewUkyTETMLEfHCGDtahLMa+XNkko6sHhW14SYwubOwMHKxcJqfO3AFQ6dtUbus/kYa3USqTMaWknqlHyAd7K+ji/PcCyheiO+p8u6b4jUvewEgeHh+4Yld0sdeUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706603826; c=relaxed/simple;
	bh=30s+uA0epAF3I7CB7bPW7lx5pMrX6Jfos+f1HTPKpm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjquL1no0bTmf2tvvbl4hJbGaTo7D0N20e2NCFvMIwGscHBKa8u2/dHMkIND/QGlDp1MIRMStY4XT7T+yebeUz2MvGyd4206j83RUh9kiYeIQ646RqUktEnwux51oDRsTpfEQXO94Qadga/OHmhrQ512WdmBzy0hze69k0i44xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWjz/ekf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBAAC43390
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 08:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706603826;
	bh=30s+uA0epAF3I7CB7bPW7lx5pMrX6Jfos+f1HTPKpm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LWjz/ekfOlQjdc9Vzndvlj+uX3O/cYqKuzIFbhEq4fOO1IDgBqpR7fyIRwU8u5gzW
	 6i5V/X2aGwebi+pkMPiBeX0ycvopCBKTomSDtMXgRa/nTRZhpq8UUYn4GULA1yMoeu
	 zn/SOlrML2Cn91eIdQYGmxND3xOsHUw3vWB04QMAuV/FOQfUtC10/Yv7p+tyKpMm71
	 qJyo02nMmUULsX0Wi8uzoWoA+rDnTHmkfuuC99iZvWLN4XMVRI6CCCO4h5mVMSYhVe
	 4iBkpWCTTN0A/nbhB1e5O5J0GLcMMZ+tG4/Yx+sMGkn9sscI7uJO9GfMGWLFste9e/
	 DxkR7dtpzjgrw==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-206689895bfso2248508fac.1
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 00:37:06 -0800 (PST)
X-Gm-Message-State: AOJu0Ywpvc4bQ0r11FfU9k6D72T3ldblRFGsXGEBIImCeEYhBWErRf/i
	KuQP3oxQa5qCu1Ew/PS8xV4WtLANvrtP1D3uUYKbUr+MQN10a09xr/vJ4cg8iOf2iMi4v3mm6nD
	l4CxhK5zFmdnsXiAqOglKV2DASEc=
X-Google-Smtp-Source: AGHT+IE7pua56+pqmeanlQXER9jx5WF926lAnem7+ypekG4rqPyKcbqASgCbqXhL0a0P3QpOj7at+X3qImNZ74vFJUY=
X-Received: by 2002:a05:6870:7e12:b0:218:a8f7:8d4a with SMTP id
 wx18-20020a0568707e1200b00218a8f78d4amr1265341oab.17.1706603825862; Tue, 30
 Jan 2024 00:37:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLshjakU3pXu_odd1-et2KfOUrhTruRcRBP=T-dhnYRVzg@mail.gmail.com>
In-Reply-To: <CAGRSmLshjakU3pXu_odd1-et2KfOUrhTruRcRBP=T-dhnYRVzg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jan 2024 17:36:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6ZrcX6XqxcjgrnHiV9BHFOvTchccxzQE4JGq7W0FqWw@mail.gmail.com>
Message-ID: <CAK7LNAQ6ZrcX6XqxcjgrnHiV9BHFOvTchccxzQE4JGq7W0FqWw@mail.gmail.com>
Subject: Re: Changes to kbuild in 6.x causing cpp build issues.
To: "David F." <df7729@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 3:32=E2=80=AFPM David F. <df7729@gmail.com> wrote:
>
> Hello,
>
> resending this because it doesn't show that it made it to the archives.
>
> I've been building an out-of-tree linux kernel module that has a .cpp
> module (plus a library that is built) for well over a decade using the
> basic method outlined at https://github.com/veltzer/kcpp.   There was
> a patch needed (provided here) in the 5.x version to be able to link
> to the .a file generated.  That patch I've been able to modify as
> slight changes occured, but now in 6.6.14 things have changed a lot,
> I'm not sure if I'll need something like it to get to the final link
> but I don't think I'm at that point yet.
>
> My main issue now is this:
>
> LD [M]  /media/sf_SRC_DRIVE/mymodule/l
> inux/driver/6.6.14-686-mine/mymodule.o
>   ld -m elf_i386 -z noexecstack   -r -o
> /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.o
> @/media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.mod
> # cmd_modules_order
> /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.order
>   {   echo /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymo=
dule.o;
> :; } > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.=
order
> sh ./scripts/modules-check.sh
> /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.order
> make -f ./scripts/Makefile.modpost
> # MODPOST /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/Modul=
e.symvers
>    scripts/mod/modpost -M -m       -o
> /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/Module.symvers
> -T /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.orde=
r
> -i Module.symvers -e
> /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/.mymodulelindri=
vercpp.o.cmd:
> No such file or directory
>
> It has never built a *.o.cmd file for the .cpp module and still
> doesn't, but the new system is looking for it.    Could someone
> familiar with kbuild tell me what I can patch / do to allow the system
> to complete the build like it used to?
>
> Thank You.
>


Presumably, the relevant commit is
f292d875d0dc700b3af0bef04c5abc1dc7b3b62c


modpost requires .*.cmd files, when CONFIG_MODVERSIONS=3Dy.


This project does not produce .*.cmd file
when building *.o from *.cc

https://github.com/veltzer/kcpp/blob/177ea052f3c52c9f85bb091235061a0e620f51=
bd/Makefile#L68




--
Best Regards
Masahiro Yamada

