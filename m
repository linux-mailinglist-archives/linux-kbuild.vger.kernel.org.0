Return-Path: <linux-kbuild+bounces-4344-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D489B1FB7
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 19:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 011E91F21433
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 18:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D67A139D0A;
	Sun, 27 Oct 2024 18:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwIh+t+N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E874059;
	Sun, 27 Oct 2024 18:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730054083; cv=none; b=VV+PPSoP71iOAvUPSnycCVJ4fgHdZ0KkAfl/5bUi4jGUKALI2bSsteqZIdMtWfs9SQS1NcJMmu4EAnYhIIeNTtO+/ZWu5ZzEfMZRjYfMyw6vTeGzlGEJVBhlTmGxptVSCs4SfsHhNfxoW1wk7zXkzysdFBRAlXpbrqZYhoVZQTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730054083; c=relaxed/simple;
	bh=Ab1LD0YPRiCsaMpw6QmeIUY4TM1fzamI5B5sMH/HSGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fy2nRwBSpElHaklIAuH8sF8dilzJsD1KkROaKkBwn4LEnWBlEb5pjvfC10sKSIfQa1gPs/o2PGKo9n/SyajeodUPffg4O7HXaHoCOIceUlP0SkiPID+1qdq79yTRMWnRrv8v1UdWf3mD3ckVx7349q54VXpbQcwVyi0ARo/UZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwIh+t+N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DD3C4CEC3;
	Sun, 27 Oct 2024 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730054082;
	bh=Ab1LD0YPRiCsaMpw6QmeIUY4TM1fzamI5B5sMH/HSGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IwIh+t+NmDWdzDo9uy+/UuRmYcIx6PygiXzpCNabpiNcsultp+7hqhXDxOLYFwPY3
	 8LHcfYKNzx6EjyWPHp6mo2LQy57BSv85SwP1Y/pqzbOEJ1/WZ6chL88GjThxZJaWLi
	 R2sqFZH1qHkuS3eHjSYJ9Efj4kSNY3q+vFww2BHTzw4JY0t7L4P8qIXXA3xC+ZrAyh
	 DSfc1DOe50EvHstnoL5VU6AqZd0Lfn2ss7yMteMLrdWwbuTL7/FnfajNnmXM6GXgx8
	 NpJSsDPbzlY8RvydVNLNwww3pYOOuEw1/pJQIGffaKrLub4zqp6vsQNBJELX89plf8
	 n+GbgE3XGrWvA==
Date: Sun, 27 Oct 2024 11:34:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Koakuma <koachan@protonmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
Message-ID: <20241027183440.GA2755311@thelio-3990X>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20241021201657.GA898643@thelio-3990X>
 <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>
 <20241022200732.GA487584@thelio-3990X>
 <etezvjy_HnDpgOTBrzap29if1ChFBhl1RawcNJK3UAsFk6i_g_cyHoz7hlqfYqASgJZ97W4HxnGA-nbCXL73pIRN9tUKUttAp1JefMRp8rs=@protonmail.com>
 <CAK7LNASbFeJc9Y=BFY85SwESUKNNDTRDunyLGveDusC--NVkCw@mail.gmail.com>
 <20241023164535.GB4081497@thelio-3990X>
 <InqlMfqWWeNw8Mh6y1y5oNb3EotVpA26gkX70xcVxt9ygCtb7DYfTB3Amg3SzZfs78q3osSW2BIEpgyhmOjSqBW7neH0Se2sQEpmdClVV3M=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <InqlMfqWWeNw8Mh6y1y5oNb3EotVpA26gkX70xcVxt9ygCtb7DYfTB3Amg3SzZfs78q3osSW2BIEpgyhmOjSqBW7neH0Se2sQEpmdClVV3M=@protonmail.com>

On Sat, Oct 26, 2024 at 02:52:52PM +0000, Koakuma wrote:
> Masahiro Yamada <masahiroy@kernel.org> wrote:
> > I think this should be documented (required LLVM version and
> > the supported build command),
> > otherwise people cannot test this patch.
> 
> Nathan Chancellor <nathan@kernel.org> wrote:
> > I am not sure that there is a super concise way to describe for
> > Documentation/kbuild/llvm.rst that sparc currently requires 'CC=clang
> > LLVM_IAS=0' along with a build of clang from the main branch of
> > llvm-project to work properly.
> 
> So about this, as a middle ground, would it be okay if I put
> 
> ``CC=clang LLVM_IAS=0`` (LLVM >= 20)
> 
> In the documentation, in a similar manner to the s390x entry?
> I know that LLVM 20 is still a couple months away but those commits will
> likely be released with that version, and since it also tells people
> to not use a version that is too old, I think it should be okay (?)

Yes, I think that would be reasonable.

Cheers,
Nathan

