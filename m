Return-Path: <linux-kbuild+bounces-2280-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B091B4F7
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 04:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4581F22C07
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 02:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7858B182B9;
	Fri, 28 Jun 2024 02:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPB3T6pE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E818046;
	Fri, 28 Jun 2024 02:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719540836; cv=none; b=KFukUJeI1pEoAjygl4RNahZzWSqo1XnBkfEnv3cVMW3l653POVY5u0UdRzqF2bk1+oEe8RDBcXb/qkaA7JTNInH86F0ZTPH8Q1j3NhYNs1R/93q7S0ZAER4UfNOUkGdelXPzCvbuztCrETcZACW2+gZ9r7TwJqNv90aLQGBsuPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719540836; c=relaxed/simple;
	bh=1QZMjqfr5KF1bfI3lvjjy/2VD24ylLZNVuIb/71bNPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5k5u0Y4mZcxJJx8Ow05v5OHFi5lhVsZPsYCXZ/HICZPFRmD9q4w0VtISeAybZUDgc/xjkqE0UTFmoiKn8Qt51B3R88loY/cfg+pY9FRMCri+yL+qREu4ys3GwP1Uq4fgC9tElKtbJXOK5sha/YrqrAZ1RdMcvGfZcne5kxhvLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPB3T6pE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FEAC4AF09;
	Fri, 28 Jun 2024 02:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719540835;
	bh=1QZMjqfr5KF1bfI3lvjjy/2VD24ylLZNVuIb/71bNPk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vPB3T6pENwWubEYz4+H3s4o7QkZpZbX3vVFuIUvqx0Otrq5yl7HqRxs4e55ST45Me
	 wkV7VXfL7NtVPwoxhiB67qegN0SoPxy/IAnTujCggRXTWh4FZ2E6QY7qoIZsNxDQ4r
	 kyVrEH5DjuJt4SeersxFysWDaH/WdpL5shGuAOnFunL21tKJa5OACN/2UIn3jqKS7z
	 Qro65m4c1C++1yKiS/Ve7zIURoT0NvrHqPapCB2txydyhVwcIuia1qjdP3iZ91ohZe
	 9AwL6sTfLx1M5Wa/O+STZ5MMCTn5ejUZRWhpTOTRlx/D5zZ4hEAyxxEyQ6emf/tL9I
	 EqJbNy9tZZrpA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so773391fa.3;
        Thu, 27 Jun 2024 19:13:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVk6Qt3xiWPOfDB0BFCttNQIrvJg3enWqkxE6jyQ7v3tSRTSrhWY7D5gh3OOXy+AptMc/eA4v1n43aifX/DHll3WBVinKNK9KSqvBqGA6GtaeGvea16CVivR4WMW10GAGFLHqrCcgqTw7VeSDCHUZdSFI0jbkmR97e0QDW3RQu3LqHLqAeP1A==
X-Gm-Message-State: AOJu0YyKZDjGIPHO29RHc3qmQYM2VrHMBActlTfvyJiEfXfx6tKeqbHe
	1TEhXJh+Vgl/rs17BpzBHkErFTv0/XRi1isPxYlLsyCeMnIdyXHAxpMPXmgym35Zxj0h01Akrz4
	YhQoHxMPbTb1Awnv4foRAg80UDis=
X-Google-Smtp-Source: AGHT+IH6vcsYs/f2tBTsB2l/yZmtIVQ+iwQAeqaKwBBrQfT2k1vyIQgzg8OwSIo6A3510Z6MhvuCGIs9TLh+uhflC5Y=
X-Received: by 2002:a2e:b0f3:0:b0:2ec:5785:ee94 with SMTP id
 38308e7fff4ca-2ec579fefd8mr92910221fa.52.1719540834420; Thu, 27 Jun 2024
 19:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240427145502.2804311-1-masahiroy@kernel.org>
 <20240427145502.2804311-5-masahiroy@kernel.org> <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
 <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com> <9771d50d95e508bf8971a36b6475c782c42b46a1.camel@intel.com>
In-Reply-To: <9771d50d95e508bf8971a36b6475c782c42b46a1.camel@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 28 Jun 2024 11:13:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com>
Message-ID: <CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "krzk@kernel.org" <krzk@kernel.org>, "nicolas@fjasle.eu" <nicolas@fjasle.eu>, 
	"conor@kernel.org" <conor@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 2:14=E2=80=AFAM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2024-05-10 at 04:36 +0900, Masahiro Yamada wrote:
> >
> > Or, fix the code.
> >
> >
> > Now fixed. Thanks for the report.
> >
>
> Hi,
>
> This commit broke my build in a similar way:
> make ARCH=3Dx86_64 O=3D../linux-tdx-kvm-out/ -j36 M=3Darch/x86/kvm/
> make[1]: Entering directory '/home/rpedgeco/repos/linux-tdx-kvm-out'
> /home/rpedgeco/repos/linux/scripts/Makefile.build:41: arch/x86/kvm/Makefi=
le: No
> such file or directory
> make[3]: *** No rule to make target 'arch/x86/kvm/Makefile'.  Stop.
> make[2]: *** [/home/rpedgeco/repos/linux/Makefile:1934: arch/x86/kvm] Err=
or 2
> make[1]: *** [/home/rpedgeco/repos/linux/Makefile:240: __sub-make] Error =
2
> make[1]: Leaving directory '/home/rpedgeco/repos/linux-tdx-kvm-out'
> make: *** [Makefile:240: __sub-make] Error 2
>
> This patch didn=E2=80=99t fix it:
> https://lore.kernel.org/lkml/20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3a=
a@avm.de/
>
> But reverting b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(s=
rc) for
> source directory") does.
>
> I'm guess it has something to do with the "M=3D" option because:
> make ARCH=3Dx86_64 O=3D../linux-tdx-kvm-out/ -j36 arch/x86/kvm/kvm.ko
> arch/x86/kvm/kvm-intel.ko
>
> ...works.



There are two solutions, depending on what you want to achieve.

The official way is to pass the absolute path to M=3D
(or relative path to ../linux-tdm-kvm-out)

The other unofficial way is to pass VPATH.
The external module build does not officially support
the separate output directory, but you can still
do it in this case.

[1] will work like before.



[1] Output module objects to linux-tdm-kvm-out/arch/x86/kvm/ (unofficial)


$ make ARCH=3Dx86_64 O=3D../linux-tdx-kvm-out/ -j36 M=3Darch/x86/kvm VPATH=
=3D$(pwd)


[2] Output the module objects into arch/x86/kvm/ of the source tree (offici=
al)


$ make ARCH=3Dx86_64 O=3D../linux-tdx-kvm-out/ -j36 M=3D$(realpath arch/x86=
/kvm)



--=20
Best Regards
Masahiro Yamada

