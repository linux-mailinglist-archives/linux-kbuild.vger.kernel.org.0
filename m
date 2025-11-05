Return-Path: <linux-kbuild+bounces-9423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E8AC37AC9
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 21:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 606F63B9403
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 20:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931FE341ACC;
	Wed,  5 Nov 2025 20:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tj/hHP3f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577C154BF5;
	Wed,  5 Nov 2025 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373868; cv=none; b=Ts18kaMDTIqbzC326YK5UVyristo4Wp6By2P4fVJDWJHEqrMWCaUOKa3fkxLWL4aDDN0Nqig7tS86mh4Fl7eSdw68bvrLmp2NQDqmycUrmkq8hm0N0+ih+JEHjLRVq+BxpM0YD4zJPFh7rxtFVj/7JsD7cNVmjQgmrv3f+dx8Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373868; c=relaxed/simple;
	bh=WK2n+MqYbpkY3Ap2OmbbUP70qaHyeaITrjrbKMCnnDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1Wq15y3oaR/1Q2H98AfsH8WX4B8gip37RKb0Hmqfrm6IvNqZB1R8CpwmBbpjB4sWP9ZIhB/mjHDe+O+nj4qQQJKr7wSSxJB9hsXS2pUVw4Zhu/x/0MgCZChEH+3ROzv096e39ZE7ONdiVeR55FGJ9AFMNm0emDVE0CWpqButs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tj/hHP3f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637D1C116B1;
	Wed,  5 Nov 2025 20:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762373867;
	bh=WK2n+MqYbpkY3Ap2OmbbUP70qaHyeaITrjrbKMCnnDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj/hHP3f9hSkcD1LIbu0U8532tJWTe2zQpS4ZuqdRQW+NLXRsPAm2QMTnshp+2MEG
	 faalOFfnAaYM95P6TDBNwYAeib+xcBszn0WsiEV0hnk69H2TZgJORw9VOP9ZRJUXie
	 kN0d1T6RasQDXCdCNd8BDFmRIqByt5Q+ECNX4YXA0YdmuVaG6vYxso2q8+3XJ67nMd
	 Y5dxsQFPMVWn7t5y91pACrr9E+cHrmCz4CYlZcaH7FteccWZfJgEySou1eYUNiTGhb
	 3wPRf+sSBJRyh47J/JxN1ELxUzpnFhG2eML71/A4dgigLYlnq6I9CML82K3DL0QePR
	 E0M8R9UsB98+Q==
Date: Wed, 5 Nov 2025 13:17:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>,
	Omar Sandoval <osandov@osandov.com>, linux-kbuild@vger.kernel.org,
	Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <20251105201741.GC3787308@ax162>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
 <aQpCE_XTU-bZHFbk@telecaster>
 <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>
 <20251105011548.GB769905@ax162>
 <aQtISpMElVm7jQ4y@example.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQtISpMElVm7jQ4y@example.org>

On Wed, Nov 05, 2025 at 01:51:22PM +0100, Alexey Gladkov wrote:
> Nathan, if you see that my changes are creating more problems than they
> are solving, feel free to revert them.

Thanks for that permission! I will keep it in mind as we get closer to
the end of the release cycle if these problems are too much to overcome.

> My changes were based on Masahiro Yamada's patches. I didn't expect his
> changes to cause many problems. Before his changes, I tried to use a
> different approach. If you think it's worth it, we can return to
> discussing it.
> 
> https://lore.kernel.org/all/cover.1748335606.git.legion@kernel.org/

Right, I had noticed that in the development history and wondered if we
would want to revisit it. I will have to take a closer look at that
depending on how things go here.

Cheers,
Nathan

