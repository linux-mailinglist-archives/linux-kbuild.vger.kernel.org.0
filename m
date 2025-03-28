Return-Path: <linux-kbuild+bounces-6365-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 335C0A7453E
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 09:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08480189C1AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 08:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443FB211485;
	Fri, 28 Mar 2025 08:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyteNLF0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B44F35959;
	Fri, 28 Mar 2025 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743149978; cv=none; b=Y6PDdzzWv7BNGRFb5hrVEFNLa53fLRG3pVQUfD9vHw+4/+Zgf78N4EX0IR4uErGtn4K9SQylyljVYarLcYIFyA6oAlgUEp43jNpIANe/IkMMf6n2M9cnqXXxivCJR69s9SdZJ4nt8rkBgY16YNl483DombEI0f6t3MmiyZ1jgPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743149978; c=relaxed/simple;
	bh=ejPr9pydniJZd8kDVyQTUzYUxPFrRYV5sFNPkeJTiSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WFhuMknFtkRL4r32iJLmYa6lwzbqhYM0it2XBQXtj1X2Qy/c8txVxa5/VzimKr16yqqoVKKjMLgnFVxnV1kaDSzZyfdgz8VLdEgQHyvkYhB1thqCuGTe3LnwDGwvrzCYga02fgOGJeJFQC7q/fJP12m6rQtXXPhB0f+O1sy6zsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyteNLF0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302D3C4CEE4;
	Fri, 28 Mar 2025 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743149977;
	bh=ejPr9pydniJZd8kDVyQTUzYUxPFrRYV5sFNPkeJTiSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IyteNLF0WLlCEYh0nyKyfigx0sMxtu3wyYcIL8v33GtyjOBzQzZeTPLmNAtQM0RQD
	 lMZ9pmi6MImTauzezTfR+Lybyl8Vu4WmAyG+u2TV/30Mj5DtiDg5p4aDrye5dspFG7
	 7H9IdArCWSPu2XZE3qBCfLwxkBVY7itlBq4NS5JRlIOf09oZldhKQdI58XKZALgcjV
	 VG8zovf5SMpcUWZOHrxyeBDhRkuQM3ygtG0lBnJZ+EuKUhozFS2sl4mkwd2ngwqyUi
	 E/aYY5aCJc/S65fp/+IRET7zhNz5lXp5886Xoz+hIFniDvBF8JXtOadWOHOUbuHfey
	 Xhu9CsCPqqRlQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre
 Ghiti <alex@ghiti.fr>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, Charlie
 Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH] scripts: Introduce ARCH_WANTS_RELA_DYN to avoid
 stripping .rela.dyn section
In-Reply-To: <20250328075536.238782-1-alexghiti@rivosinc.com>
References: <20250328075536.238782-1-alexghiti@rivosinc.com>
Date: Fri, 28 Mar 2025 09:19:34 +0100
Message-ID: <877c49tvmx.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

> riscv uses the .rela.dyn section to relocate the kernel at runtime but
> that section is stripped from vmlinux. That prevents kexec to
> successfully load vmlinux since it does not contain the relocations info
> needed.
>
> Fix this by introducing a new config ARCH_WANTS_RELA_DYN that prevents
> .rela.dyn to be stripped.
>
> Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly=
")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks, Alex! This fix makes it possible to kexec into RISC-V vmlinux w/
CONFIG_RELOCATABLE.

Tested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>


