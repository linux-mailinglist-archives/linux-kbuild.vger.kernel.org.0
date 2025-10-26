Return-Path: <linux-kbuild+bounces-9282-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C13C0B405
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Oct 2025 22:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07E6D3B101B
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Oct 2025 21:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B78328312F;
	Sun, 26 Oct 2025 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccCqsRnu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CE2280331;
	Sun, 26 Oct 2025 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761513218; cv=none; b=C4vZayR2pwTFeP3Gz/Z1+VzKtkeEunXNIKiHEG/vLZ9KYbIr0xkEtFZWtIhxjSi3gZilszd/e4e2tNwfJ/Obs7/FabimcKzzETxJv+KNnpOvrM7ydm2X1ck7fOodcjQdtzD7+JHvMSDiRGqHxGxp/VNF+Nc+QhKqI9sRvi1bu24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761513218; c=relaxed/simple;
	bh=DJXykrN3Nyd453eZOV3WjB/rXoRRSF/JmzajmI3DMJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekDBv4bnf8R0f1vorn2axVQgpYqqKqXKPFsIsXSaUopfffwxl3n9kj+3beBam8CjvHg9uPc4M5RhIeNktsxGnkuLKsPTCCQD0jKWbgmaXxpQ6eFBOacdEDFJkMpeSu6c2HF+v34AdoaAJAIUyhy6UPFhfBAZIOroC6eZUb+YnQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccCqsRnu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A79C4CEE7;
	Sun, 26 Oct 2025 21:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761513217;
	bh=DJXykrN3Nyd453eZOV3WjB/rXoRRSF/JmzajmI3DMJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccCqsRnuz8P4G1s8g30RBwCFy+aK5ErfD2BgwMqMTU6xfok8rsLYPy0mDbLmNHvNl
	 GQMr0HBe4H1f4xlpaDlYaqvWNgoB4yJPLrVUJs8Lo+XpK97LrPIdmItvthoALLlJNZ
	 f3g7vak9rVJ5/IngSWlf7bfovIojUtseVHqaym+qeqVoWKxvAHqSHRicKgn7v9RR7l
	 piGSVjw1QG6Pn0dCLMAkLfaT0+wf/YC3/xiX541lrtIaC67Vs5hAUpoF1HiAPOLj0L
	 Wkd9Bcp3tQsFgqSon9bH72kQ5zi34dquOmKohVvyY1Jz88tOOhFGbcYL4YRCr4Rb/Y
	 Lpokz+0oegadA==
Date: Sun, 26 Oct 2025 14:13:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
Message-ID: <20251026211334.GA1659905@ax162>
References: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>

Hi Eugene,

On Sun, Oct 26, 2025 at 09:25:45AM +0100, Eugene Shalygin wrote:
> I've got a problem booting the stable kernel 6.17.4 and 6.17.5 after
> updating from 6.17.3 via make oldconfig. Out of my 4 amd64 machines
> running Gentoo, two are unable to boot with rEFInd showing "Error: Not
> Found while loading <kernel file name>." Bisecting kernel sources
> points to commit 5b5cdb1fe434e8adc97d5037e6d05dd386c4c4c6.
> 
> All four machines use very similar toolchains: GCC 15.2.0 and
> 15.2.1_p20251018, binutils 2.45.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=220700 has kernel config attached.
> 
> Would appreciate any hints or suggestions.

Does applying

  https://lore.kernel.org/all/20251026202100.679989-1-dimitri.ledkov@surgut.co.uk/

help with this issue? Also, does 6.18-rc2 (or -rc3 if it is out by the
time you see this) have the same issue?

Cheers,
Nathan

