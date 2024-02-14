Return-Path: <linux-kbuild+bounces-942-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8862855453
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Feb 2024 21:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8720B1F2121E
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Feb 2024 20:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48148128801;
	Wed, 14 Feb 2024 20:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+SLe7C5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23776128384
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Feb 2024 20:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707943795; cv=none; b=Sk0h2uqs78gF8vZTENf/Nsb7LcWAr54afTPo2yvXP24YOO1L/Xq97bFkbwPwI+YC9v5pPeNhbLmmp9/zyA1TP+O/VTQhnM+02B1117527EaYDUj+tUioShL2yrbuU3Db5DEoVgJTx/JyvYnFXWwUTNDPQUr2rYQ1yKvusXbSKo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707943795; c=relaxed/simple;
	bh=O7WgEFqn0DYXMUNVtRHA34kSmMjbZOPzFaI7yf/NlA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPgdD8zVRXbIwvmz+SsUiC8eEO5oap+zSqY/d02OkYSSIJMGXmoGXCj9+cZ5PIeOpIfdYbjDqDumRdyPCaZcDTYUllv8qewjWzg3R4W5hZC44nNIvaxk+3Pg7xQh3abN4WcMjYfv6IuioLvR2pQSuXML0dNZ11zTZ41Rfha8qOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+SLe7C5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E12C43399
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Feb 2024 20:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707943794;
	bh=O7WgEFqn0DYXMUNVtRHA34kSmMjbZOPzFaI7yf/NlA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u+SLe7C50jNkZ9OcuRdDY7dTpV+QL8u7X+pF+zbgFbwNNbwTRHsGFphKCpvz7ETOb
	 F41Hy0tR8EQU4L/f0KHa5ryEa55jo+Km+nf0i22vvDx/NiNLJVoY5a6ZtMUW4LTQ7t
	 pvtJ1vKgbH1BnnDbGXNSkEFWqWeySY24hLO08UaVT9li7Pb9A8zczL65DZt9KDXu30
	 8bwfdK4bc4MRhBhO3kWMFplNGKhU3mFxITyivQLQWRbdESqwnLAEMItW3V6Ph7AqhB
	 7Dj0Tl9tNcUfY7ehc6r4A2HXK76FaPupobYRuz12sdRkwQwJAxyqC/bNFwNI6f401d
	 rDsqTrWn6HG8A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51182f8590bso180371e87.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Feb 2024 12:49:54 -0800 (PST)
X-Gm-Message-State: AOJu0YzAIW8LMFCySt2X9Uomqdh7vGWXJAeb0/I5z+IGMUS8ZUivPgrd
	ajqV1RB3n7vB9VWrZcy1BMiz9x/xAYVRXkK0UYng+9Ykbz5o4ODMgoWoiWI3y2kNjQt10ref1Lh
	Us5fsW4RVFbz+pJX4cpM+Ilt4KKA=
X-Google-Smtp-Source: AGHT+IECBEIHnZZbcDW1B2X72AtD4cirzXciIg9lP8bkKD3N1Ov77XgQ1tFCeFd/Oxi2bt8y5uUWmtJlk4fLGxvf3XM=
X-Received: by 2002:a19:381e:0:b0:511:9f0d:633f with SMTP id
 f30-20020a19381e000000b005119f0d633fmr2444647lfa.14.1707943793195; Wed, 14
 Feb 2024 12:49:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <951fc31ee754ba86acaa9556e1d28c13075c66a2.camel@suse.com>
In-Reply-To: <951fc31ee754ba86acaa9556e1d28c13075c66a2.camel@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 15 Feb 2024 05:49:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJ+=Kd5a=wkHZDzHSEACHfYavUa4GdiSKZh5eSwMG6wA@mail.gmail.com>
Message-ID: <CAK7LNATJ+=Kd5a=wkHZDzHSEACHfYavUa4GdiSKZh5eSwMG6wA@mail.gmail.com>
Subject: Re: Out-of-tree module building fails with O= argument
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: linux-kbuild@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Petr Mladek <pmladek@suse.com>, mbenes@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 11:02=E2=80=AFPM Marcos Paulo de Souza
<mpdesouza@suse.com> wrote:
>
> Hello Masahiro and Kbuild ML,
>
> Recently we added out-of-tree module building on kselftests for the
> livepatch selftests. Everything worked as expected, but kernel test
> robot complained about it[1].
>
> So far, all our tests were being done targeting different options for
> kselftests, but we didn't test using the O=3D option. The interesting
> part of it is that this can be easily reproducible with any out-of-tree
> module building even on current upstream, like the code below:
>
> $ uname -r
> 6.8.0-rc4+
> $ make
> make -C /lib/modules/6.8.0-rc4+/build M=3D/home/mpdesouza/test-oot
> modules
> make[1]: Entering directory '/home/mpdesouza/git/linux'
>   CC [M]  /home/mpdesouza/test-oot/patch_1.o
>   MODPOST /home/mpdesouza/test-oot/Module.symvers
>   CC [M]  /home/mpdesouza/test-oot/patch_1.mod.o
>   LD [M]  /home/mpdesouza/test-oot/patch_1.ko
>   BTF [M] /home/mpdesouza/test-oot/patch_1.ko
> make[1]: Leaving directory '/home/mpdesouza/git/linux'
>
> But it fails when using O=3D argument:
> $ make O=3D/tmp/kout
> make -C /lib/modules/6.8.0-rc4+/build M=3D/home/mpdesouza/test-oot
> modules
> make[1]: Entering directory '/home/mpdesouza/git/linux'
> make[2]: Entering directory '/tmp/kout'
> /home/mpdesouza/git/linux/Makefile:733: include/config/auto.conf: No
> such file or directory
> make[2]: *** [/home/mpdesouza/git/linux/Makefile:240: __sub-make] Error
> 2
> make[2]: Leaving directory '/tmp/kout'
> make[1]: *** [Makefile:240: __sub-make] Error 2
> make[1]: Leaving directory '/home/mpdesouza/git/linux'
> make: *** [Makefile:6: all] Error 2
>
> As I already described on [2], the O=3D argument (or KBUILD_OUTPUT) makes
> the kernel to jump into the directory specified on the variabled, but
> running the Makefile on /lib/modules/6.8.0-rc4+/build. The problem is
> thattoplevel Makefile on /lib/modules/.../build includes files using
> relative paths. In this case, the makefile tries to find
> include/config/auto.conf on /tmp/kout, which obviously doesn't exists.
>
> Do you think this can be a bug on Kbuild? Should we ignore O=3D when
> building out-of-tree modules?


No.

O=3D is not meant for the output directory for external modules.

O=3D is supposed to point to the object tree of the kernel
(when the kernel was built in the separate output directory)











> Also, as noted[3] by Petr Mladek (CCed here as well), kernel-devel
> doesn't include auto.conf, so maybe kernel-devel should be patched as
> well?
>
> Thanks in advance,
>   Marcos
>
> [1]:
> https://lore.kernel.org/oe-kbuild-all/202401300736.GkSZoSrA-lkp@intel.com=
/
> [2]:
> https://lore.kernel.org/oe-kbuild-all/fd027fa958a0bc65285a0c6c42e5921e7d2=
8b0ad.camel@suse.com/
> [3]: https://lore.kernel.org/oe-kbuild-all/ZbpnBqHUl3pE_3Te@alley/



--=20
Best Regards
Masahiro Yamada

