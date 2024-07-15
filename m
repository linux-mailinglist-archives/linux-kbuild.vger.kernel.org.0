Return-Path: <linux-kbuild+bounces-2536-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4299E931897
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 18:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED60D1F2270D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 16:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A8A22626;
	Mon, 15 Jul 2024 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJotXoGt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46A4225DA;
	Mon, 15 Jul 2024 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061567; cv=none; b=m0Ny9lBclVGz933w9yQhOFaAjMz3/vBK7kpnCttID4FRmv7bJ1fIurE9W4lIDFiJJD7l8Tjh1Fk7SWCmP808B9zuKDalFi7B2LDR7QIxW1Wdy+OThwlsB0PCS9DejgXP2zzzxpTmWSHVVr++Cre6vqksDjwvB/55u6PmIQkFFZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061567; c=relaxed/simple;
	bh=82LA9oTdWdNNOcKpEekI3O0AXuZjf8m09y5LDdFj5j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKl54S50Z4ikENd7sIj2LYLpo1GIBQTxOmvQRNT6TxFXk2MJtLdbQcN5YiMGDDzaNabR4UkXPGtGwGs2CT93b1QrytOM5LxZ1UFSFtv8feMWNVfwZ6+ye3cvgRm2de1aLM13dZQAKATyQNixurrIjhkWZ47Ohm/MF8LH+kdxY9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJotXoGt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658ACC4AF0D;
	Mon, 15 Jul 2024 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721061566;
	bh=82LA9oTdWdNNOcKpEekI3O0AXuZjf8m09y5LDdFj5j4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hJotXoGt9UNc4UbcRUmbcK2cbsbGlgWKk+FoXf/UXruGi0ZJVttVORnwk4pO06in2
	 t7avHfhzet3DVEmXhvDMz94eDgqL4YT6HjxtO5a98rTpWbBc2PVrOuDFEIDIf6bl0H
	 Q37WU8lXTMyjYl4XhWB9WW80tpv/cmuJhQYIlAgQehxUx9xRtSZ08FmRnjSoAHqnTP
	 2R3UDqi368GZs+FY77rstf0/fD+OOvshLBTugWwXuh/m3vaazVXUk2XEFh9qq8xXqS
	 55pSU6xTZDJdy4Z3HUI+oMyw0Q1MoQu920Y3trS3hFnROgh3qZdXBuQ9Aw1BA01g0Y
	 nG8S/WaQFfD2w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea79e689eso6381211e87.1;
        Mon, 15 Jul 2024 09:39:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWo6qBVSRZETJoSSTHMNegasQKu4js5K/QGBRN1CrxFWYEe9KBrLcBYUIvnAWwsA/dwpwn0WpJc4qkT5yQChFd8yTuw4Q+qOGjHTESk1XER8kXV/1fW6N6QmOHYtCHV9sMNEeo0zdUU1xYk
X-Gm-Message-State: AOJu0YxE8Yz35MaMx671qbiH12ff9LuHR4Q7CKyV3BMSAeZUkAB66DIm
	VkwAKEJ07sK2vE26U9lDe1tdPcZIWLhHG88MATnbwCf2hotICD0Zk4MQ7XNbE/2dBiy2txVYll0
	pwUQZmmtzgpS6/n88NoFbK2p2rEs=
X-Google-Smtp-Source: AGHT+IGxPzXD3QSs/6Dv2oXoKA8CP5cnB7NfH523pRmTeHHXispFdRWPahC1XhxoiuH8fVM3p/RihNU3y2vnB3WrszY=
X-Received: by 2002:a05:6512:4002:b0:52c:df83:a740 with SMTP id
 2adb3069b0e04-52ede1b2d94mr69300e87.30.1721061565037; Mon, 15 Jul 2024
 09:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715144529.101634-1-masahiroy@kernel.org> <202407150905.56BBE11@keescook>
In-Reply-To: <202407150905.56BBE11@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Jul 2024 01:38:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNATh-azmUyp_4uOAJ+e=0O25vvkb+yNrNJDU_5nZS3NqYA@mail.gmail.com>
Message-ID: <CAK7LNATh-azmUyp_4uOAJ+e=0O25vvkb+yNrNJDU_5nZS3NqYA@mail.gmail.com>
Subject: Re: [PATCH 0/3] fortify: fix various issues in test_fortify Makefile
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 1:07=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Jul 15, 2024 at 11:45:22PM +0900, Masahiro Yamada wrote:
> > Applicable to v6.10 tag.
> >
> >
> >
> > Masahiro Yamada (3):
> >   fortify: use if_changed_dep to record header dependency in *.cmd file=
s
> >   fortify: refactor test_fortify Makefile to fix some build problems
> >   fortify: move test_fortify.sh to lib/test_fortify/
>
> Thanks for this improvement! I will take this into the hardening tree
> after -rc2, unless you would prefer to send this during the merge window
> based on your tree? (The fix you sent for the v6.10 release means my
> trees based on -rc2 can't apply this series...)



No problem.

This patch set is not urgent.




>
> -Kees

>
> --
> Kees Cook



--
Best Regards
Masahiro Yamada

