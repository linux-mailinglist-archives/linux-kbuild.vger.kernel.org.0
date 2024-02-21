Return-Path: <linux-kbuild+bounces-1026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6749485E910
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 21:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 991AF1C232EC
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 20:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECF82C18E;
	Wed, 21 Feb 2024 20:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mTHYVEhr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419B2EB0E
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708547433; cv=none; b=KZtxyALOXgYQiZxkxSVZ+A0GXhn+NfRzEBzT+E2pVYKnzzJXgx+6tE+cl3efKV70ro03C4rSSc8M1VOme3x9+PY3eznndOW6VN2hojhA/nZ90OJNBR0GcY6u+WevytYX7GzhRAhgWQY1Ffmvb4+OaHLpuFave4k1xQ4fMVNwExU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708547433; c=relaxed/simple;
	bh=vWEUJWbOIDWjPVpsgtWgbej7BleeWIMrMnxc/5NBnN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VroLqVzxCgtKlJZlpA35+fgXOLwRqoe92xFmZ/hz8GOX2I5v/SvGSn8GKkWIWyzzqp/Gt5n6KhJlYMiuniW7IF5wMTrjTrwm80YFBVQ8VmH0i7XwrHLPt/YrNYS6bHE+BsmwP4JdTeJrje1L/1vV95r4nf18mRprQbhPdXZ2Rvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mTHYVEhr; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5650c27e352so112a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 12:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708547431; x=1709152231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWEUJWbOIDWjPVpsgtWgbej7BleeWIMrMnxc/5NBnN8=;
        b=mTHYVEhrbqNew1JkiUQytTshKEogY+StCD9t8+hxWSFhiVQtWNGtyGK0mZFuZZyXCw
         txPg27l9xifIOzRMtWHD9HDs6MZMdjZCbMQPtbDKpBQDDs+bkOLO8uRhlr6A/I3F+s61
         RfKkMnJWhyh1bJ6LVaz1cgpVObEj/d12ufqEvuSf+SURj7T/TFFopU5AhHH35L2vdvu0
         IZeVkCn2KdCEnCM6BFBUQyMFaofmHOdkQ5w8VGlfQZ5Sv84vDL+ASIoVpGZdojpL+keZ
         UydFWbcWLNXb3ma8D37UX/Myg6vpAm2UzwTwTogbA8dXSIVXmc0FU5O3/YpQoPdJzC2g
         nSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708547431; x=1709152231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWEUJWbOIDWjPVpsgtWgbej7BleeWIMrMnxc/5NBnN8=;
        b=Xv1z8BCBNO3KG9yvyuPQQV0vKDyxxUJztClk3Zj9b8ma4068aJqe+cwQNRoVFu7tfl
         C+QkQuwvYXFq4K8K8HkAc0JtOjm0VuL5dCMixcBAtAnmO2jTHz0RBvrHrafUETzW4mS4
         12UoDTHj+PTqzfAs/9djWw4Cf+ot8y7QmK8io9iHs50W/ko1j2rjhUR7P3Z3ggZ0HWBf
         wTiuq6BJie8yCoWFj9ZVSvqkXkbHfJ34pJ7iG1SvOGF7sOsT+7ODfw7mF19TFRFNqGdf
         mvXnkLs61tDfRaXDljfrZ/wSqT82/od885kZmYxYsbpLx+PLV0NNNZ3cqd53EZaVxYz5
         PAOw==
X-Forwarded-Encrypted: i=1; AJvYcCXxJq5UbCIJiGeerNaaj2ZqzE5drAjsnqGW9eVwpCLkGzrTf5bKVtYKhusM/iLGerRJokabEH3/HRCY4DOwyky6SJQu8NGhboZCatgY
X-Gm-Message-State: AOJu0Yz1eHcCVPO41owy0dFGDjvojWfM3PxiN9wry/ZSkWfj3vD5/44u
	5jy8mvIxNjNDLyPl5n9gBOBtDhMeqCwtTewbV3370JUBkSreDiyOc6Xz25QuDPdhLQfTKkH3HTs
	QG3f60UGcmfohi8fzGgatbXDLuNohnTqFmKeY
X-Google-Smtp-Source: AGHT+IFJQdjnzexcJWCML3UMWx74aD0VruZXS+4JJuNs7X76tjiq4WWxds/j68Rk4Kcl1KKjPeYpseCylVjLBycqA98=
X-Received: by 2002:a50:c30f:0:b0:564:55e5:6ee1 with SMTP id
 a15-20020a50c30f000000b0056455e56ee1mr261904edb.2.1708547430535; Wed, 21 Feb
 2024 12:30:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221202655.2423854-1-jannh@google.com> <20240221202655.2423854-2-jannh@google.com>
In-Reply-To: <20240221202655.2423854-2-jannh@google.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 21 Feb 2024 21:29:52 +0100
Message-ID: <CAG48ez189R9uJA2QATvdZuphkx2TZbu3JE9oCB4VCujaV_0TEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kallsyms: build faster by using .incbin
To: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Zhen Lei <thunder.leizhen@huawei.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 9:27=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> Currently, kallsyms builds a big assembly file (~19M with a normal
> kernel config), and then the assembler has to turn that big assembly
> file back into binary data, which takes around a second per kallsyms
> invocation. (Normally there are two kallsyms invocations per build.)
>
> It is much faster to instead directly output binary data, which can
> be imported in an assembly file using ".incbin". This is also the
> approach taken by arch/x86/boot/compressed/mkpiggy.c.
> So this patch switches kallsyms to that approach.
>
> A complication with this is that the endianness of numbers between
> host and target might not match (for example, when cross-compiling);
> and there seems to be no kconfig symbol that tells us what endianness
> the target has.
> So pass the path to the intermediate vmlinux ELF file to the kallsyms
> tool, and let it parse the ELF header to figure out the target's
> endianness.
>
> I have verified that running kallsyms without these changes and
> kallsyms with these changes on the same input System.map results
> in identical object files.
>
> This change reduces the time for an incremental kernel rebuild
> (touch fs/ioctl.c, then re-run make) from 27.7s to 24.1s (medians
> over 16 runs each) on my machine - saving around 3.6 seconds.

Ah, I found no maintainer for this file in MAINTAINERS, but now that
I'm looking at the git history, it looks like fixes have come in
through Masahiro Yamada's kbuild tree? So I'm not entirely sure
whether the maintainer for this is Masahiro Yamada or akpm.

