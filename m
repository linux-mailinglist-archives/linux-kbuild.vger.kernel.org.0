Return-Path: <linux-kbuild+bounces-5984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 869BFA551D9
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 17:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E8E53A802C
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 16:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF26269AE7;
	Thu,  6 Mar 2025 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhpUO6eC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A332698A8
	for <linux-kbuild@vger.kernel.org>; Thu,  6 Mar 2025 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741279667; cv=none; b=VWKxFiq/GpuZ53/vTSDCoAupXqykhJY2sXCD/0hipDx3f5BOEwBgzRj+/v7fh1E/LOMb108sKs42nbGIyc9PSp6MG8iG4/ydZx/nYAk6sM8kQ3LLtjI4uCrzd9FZ4GiTSGy4E8h9zqNP/5372gqGNMhhjFK4N3kw2SL48Z677fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741279667; c=relaxed/simple;
	bh=twFTbYxAB1EArSmPyT2JRqopxKqWs42pTkltMVGd1gA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=iH1Xz9tLjpOR79RTdrQ7scpkrvsJKhDE1Tia3gOV6EddH3e6S43TjrfW0nhGQ3M7Mxd6gEtM2n0WrniJVLnLjBv9cSl1b/BvkYgcs79bSgdz0AXrzpUIB2yYGZyE6gs2n34Q4HjDWIZC6Csdktuz15vvR9uhbYmZ2uSRPpb/z7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhpUO6eC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBFAC4CEE0
	for <linux-kbuild@vger.kernel.org>; Thu,  6 Mar 2025 16:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741279666;
	bh=twFTbYxAB1EArSmPyT2JRqopxKqWs42pTkltMVGd1gA=;
	h=References:In-Reply-To:From:Date:Subject:Cc:From;
	b=QhpUO6eCNrtrllawflc6gCLCYI1Kn+tIfRMdkg4ME11yaYzCLWcRUoRJtx3z6dfLe
	 moH5TeID0FA9GNEXP5a/dlY9zLbLp08NEQ800o+/eqcXlPSRpnugFbgGomBvKQ9Shg
	 NSJnTl4+XspVZooYMw65XT7zprutVB92Fs3K2PsxdCbB8nKSGtALu5m454YOWbyJ1+
	 A6jLVvKpp5GsusiOcTYav9mqyHR4779cNrVdfgeOhLluudoZReIJHsSGpbhA6MGJm5
	 DXcm+ViEFciQ1U7BYKJz8Ak8XnxtUcTDnxTZVlE1O0ImLA5uVEEaA8nzmoi8E3ILa1
	 mEjy+iWHPBtOg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54298ec925bso1383808e87.3
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Mar 2025 08:47:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8yWv2SA0uxFpsQMPNKg83R32pGCf6CWOjB8y/1B0CtkVT3jTD5LGVnIQyfxMLFBHaY6AI/K0awNduRBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDlkb/OYS+cXwzR/gtRK4p2czikhnmUuoxd8Ks2vR7Teb7UG5O
	eUvYTKLc8mowYypy4PNSAL8Thwu/FmtehCotgRFlEUvI2XIr2PYCX4pm4NcBMA+pIJfXWLLym7P
	+SV8MqxYKIjbNk39ozzBX59Rbhuc=
X-Received: by 2002:a05:6512:1241:b0:549:733b:6afc with SMTP id
 2adb3069b0e04-5497d3358bemt3061165e87.12.1741279665290; Thu, 06 Mar 2025
 08:47:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com>
In-Reply-To: <20250224132132.1765115-6-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 6 Mar 2025 17:47:33 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
X-Gm-Features: AQ5f1JqSV6MLnlpRrip5gVWxbX6kcgtJrmEkxxn0pKEv2rCJmgtvhbpESrpcKwY
Message-ID: <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2025 at 14:21, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Kbuild supports an architecture specific Makefile.postlink file that is
> invoked for the vmlinux target after it has been built. This Makefile
> takes 'vmlinux' (which has just been built) as the target, and mangles
> the file and/or constructs other intermediate artifacts from it.
>
> This violates the general philosophy of Make, which is based on rules
> and dependencies, and artifacts that are rebuilt only when any of their
> dependencies have been updated.
>
> Instead, the different incarnations of vmlinux that are consumed by
> different stages of the build should be emitted as distinct files, where
> rules and dependencies are used to define one in terms of the other.
>
> This also works around an error observed here [0], where vmlinux is
> deleted by Make because a subsequent step that consumes it as input
> throws an error.
>
> So refactor the vmlinux shell scripts and build rules so that
> architectures that rely on --emit-relocs to construct vmlinux with
> static relocations preserved will get a separate vmlinux.unstripped file
> carrying those relocations. This removes the need for an imperative
> postlink step, given that any rules that depend on the unstripped
> vmlinux can now simply depend on vmlinux.unstripped, rather than inject
> a build step into Makefile.postlink
>
> S390 should be able to do the same. MIPS and RISC-V perform some
> post-build checks on vmlinux, which is reasonable in principle for a
> postlink step, although deleting vmlinux when the check fails is equally
> unhelpful.
>
> [0] https://lore.kernel.org/all/Z5ARucnUgqjwBnrp@gmail.com/T/#m731ed0206949fc3f39fcc8a7b82fe348a8fc80c4
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Ingo Molnar <mingo@kernel.org>
>
> Ard Biesheuvel (4):
>   Kbuild/link-vmlinux.sh: Make output file name configurable
>   Kbuild: Introduce Kconfig symbol for linking vmlinux with relocations
>   Kbuild: Create intermediate vmlinux build with relocations preserved
>   x86: Get rid of Makefile.postlink
>

Ping?

