Return-Path: <linux-kbuild+bounces-4335-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 663089B18CB
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 16:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AE59282880
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 14:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6047182C5;
	Sat, 26 Oct 2024 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="YCuf0tI3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D863C8BE7;
	Sat, 26 Oct 2024 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729954381; cv=none; b=k7qvFi5eGQ7ezJymHTRhvbGtZH6ucbZ54pZodNCa0DpNQx9kKW+4zEqCYcMmX17eHDD0jszeSUnRVBDxuzEwIW66FKfgygtHrrMx5C1uSZfLs61JdoemcJbyY6Ycv9yeg2yu0EZXI0DQyshmaELY/MuL2MK5ljQdmC6UHBWYjtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729954381; c=relaxed/simple;
	bh=RS8IrHOaqKxd3t6mKEtbkri6IpsmfydK9PDReOKODZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=clh6ESYvtzv/FaWNu1B/WPzCAQi39gsG88qtmqTA9sIWG26ivNTQiq2jDVDt8gldjFFK9BofT98l+yAQBMepCz6GFvGh2bdeTAbNr0HfZFZ9c8aG7JKQC0PWELkrOFBRDh/Z0UmSZRRJrdBpHACfqPFJ+DYMRP3xC2UvSO8zvGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=YCuf0tI3; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1729954377; x=1730213577;
	bh=RS8IrHOaqKxd3t6mKEtbkri6IpsmfydK9PDReOKODZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YCuf0tI3wz82xbLuPiWm88bDP1dc9NrlUGH7igQhWJQwcqOSsDg85Cx9WkQJ/Qel1
	 1oqTk7ImyuBInm/8Qkpyd4FGMZD1AF6NISIhKMHu+eGTj46oDEN6oAy6+y0hqzCMh8
	 p1dzr2vpjf/D/mVvcSRi28neBU5jE6RoXN5zf4lwmTYLpjCFu4y78uIrOQAHywyfr8
	 l6NyVEFhDWkozYHdwL6iNLc4v9fkSIbegsvWmdTBJmWas09nauNeKdzVG8pabJ61Mr
	 8kdkju7DQ2G8FvNoubZxKbasaCJBnBTjEDg7iREMqOq1tE0Ycfgi/g38t8DtEzebc4
	 zO/T67nGtWgQw==
Date: Sat, 26 Oct 2024 14:52:52 +0000
To: Nathan Chancellor <nathan@kernel.org>
From: Koakuma <koachan@protonmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
Message-ID: <InqlMfqWWeNw8Mh6y1y5oNb3EotVpA26gkX70xcVxt9ygCtb7DYfTB3Amg3SzZfs78q3osSW2BIEpgyhmOjSqBW7neH0Se2sQEpmdClVV3M=@protonmail.com>
In-Reply-To: <20241023164535.GB4081497@thelio-3990X>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com> <20241021201657.GA898643@thelio-3990X> <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com> <20241022200732.GA487584@thelio-3990X> <etezvjy_HnDpgOTBrzap29if1ChFBhl1RawcNJK3UAsFk6i_g_cyHoz7hlqfYqASgJZ97W4HxnGA-nbCXL73pIRN9tUKUttAp1JefMRp8rs=@protonmail.com> <CAK7LNASbFeJc9Y=BFY85SwESUKNNDTRDunyLGveDusC--NVkCw@mail.gmail.com> <20241023164535.GB4081497@thelio-3990X>
Feedback-ID: 6608610:user:proton
X-Pm-Message-ID: 5461d90c73e394b15b2b073b85e3c9776ac98e91
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Masahiro Yamada <masahiroy@kernel.org> wrote:
> I think this should be documented (required LLVM version and
> the supported build command),
> otherwise people cannot test this patch.

Nathan Chancellor <nathan@kernel.org> wrote:
> I am not sure that there is a super concise way to describe for
> Documentation/kbuild/llvm.rst that sparc currently requires 'CC=3Dclang
> LLVM_IAS=3D0' along with a build of clang from the main branch of
> llvm-project to work properly.

So about this, as a middle ground, would it be okay if I put

``CC=3Dclang LLVM_IAS=3D0`` (LLVM >=3D 20)

In the documentation, in a similar manner to the s390x entry?
I know that LLVM 20 is still a couple months away but those commits will
likely be released with that version, and since it also tells people
to not use a version that is too old, I think it should be okay (?)

