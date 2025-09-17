Return-Path: <linux-kbuild+bounces-8839-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4154B7C537
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 13:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B04A1624AB
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 11:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B5135E4D8;
	Wed, 17 Sep 2025 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dB1vlkc+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4C72D0283;
	Wed, 17 Sep 2025 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110265; cv=none; b=UISteXK1eYXHHpn0FrMADhas44Qw8F0g/haBc8ZnJqmRzgjTHp4abLAGUcKAgJMOkhzQoPJOOB88KGgUk9VDKbw8t7SsAwP4QXFc42qNY9cyWzoHVAkgnGZutgMR+1atp6yFLTN70MzTLj5ElUD9sVFnwXnxI6rxCNVdIcKsEQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110265; c=relaxed/simple;
	bh=yAtyJklg2yAwu0RzoMIivRmDNLL2QKV6gf0o4ZJQdPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpXZ2V3a+FXxjcviEZlUkbxjTBnJoYc3wKb+VFRGjWIaSbutmG0HyWyNRdugz1Nhw8IdSsP2aoPzXRYuuyKig/z67xLdJrzSdbTFV+bZTKIZEl0dSmy1VofPt3mVt5r2Dq99ADrrkxLRUOiAkhi1eVPBsC9H/KgSGENyn31H/M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dB1vlkc+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3894FC4CEF0;
	Wed, 17 Sep 2025 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758110264;
	bh=yAtyJklg2yAwu0RzoMIivRmDNLL2QKV6gf0o4ZJQdPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dB1vlkc+4HtYcbP4UTiAoHTxaIyrm5TdC7AgGSaD2UXnGf2cmwRHPmL7PSVSEi2Dc
	 f74GIwAYxIBqMwf1kNvu5KX+gZx5yk0b/dxxQGdD26DrmnCvgvjcawI+PwKTGfhOPn
	 TBizrR4PaptUAJxl2rr1HGj05jMuOU6znFjUhXldndsc+RuHVXMaZzT6pP7ysfVTP3
	 XBRpv9KKcVfnZwd5RwOY2sZ0fBN4jwwp0+fSSPl3Pbsfh5bx99C76jP03GoQ6eZj5H
	 y+TvnR9/HCf4ar9wm0/XXFKgZziEd2/kYcBTSUhSRYp+zDpW/Oc+noz50LmLMKiaKW
	 MubgqaLDRq/Tg==
Date: Wed, 17 Sep 2025 13:57:23 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v7 2/8] kbuild: always create intermediate
 vmlinux.unstripped
Message-ID: <aMqiI0PlyTZGPWhR@levanger>
References: <cover.1755535876.git.legion@kernel.org>
 <df6f570daa38a22da59135b294705e3c5680e441.1755535876.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df6f570daa38a22da59135b294705e3c5680e441.1755535876.git.legion@kernel.org>

On Mon, Aug 18, 2025 at 06:54:56PM +0200, Alexey Gladkov wrote:
> From: Masahiro Yamada <masahiroy@kernel.org>
> 
> Generate the intermediate vmlinux.unstripped regardless of
> CONFIG_ARCH_VMLINUX_NEEDS_RELOCS.
> 
> If CONFIG_ARCH_VMLINUX_NEEDS_RELOCS is unset, vmlinux.unstripped and
> vmlinux are identiacal.
> 
> This simplifies the build rule, and allows to strip more sections
> by adding them to remove-section-y.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  scripts/Makefile.vmlinux | 45 ++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 23 deletions(-)

Reviewed-by: Nicolas Schier <nsc@kernel.org>

