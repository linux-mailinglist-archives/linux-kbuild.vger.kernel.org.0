Return-Path: <linux-kbuild+bounces-9544-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C0C4960E
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 22:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BCB9434ABAB
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E812223FC54;
	Mon, 10 Nov 2025 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YentD+eD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE17483;
	Mon, 10 Nov 2025 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762809354; cv=none; b=NQPYAo0QDDwgSFJlVSfv+Dg7kGDXmrWUtyEwiLvrv8gMBoUcNwYjltJPjmZFUjw/k/d6W47oxRuE2MD51r9WEn3jGg9HEqSpMEeXAOHClREg01S0OuUxIZKZaiDzpKAaA/UTx5r9VRKVrrjEkia4k5mrNeXzXNK6HcZTF1fdDQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762809354; c=relaxed/simple;
	bh=nU1aN92dZSsCn1PBV4nnPJswWj+0MTQ5OdXs942PIhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAwDoCeizQmzGBLyLwqAUc0qvLkKwDAGmEfNro5HORdC4Gc2I7VuZUXijdCs4alK54++ae6EzS/grSThEDhrY9/9qo3Hnn/iyNQ4eTsNMKmE6N6yLlgW2rBRWCBYeDB9V5e4pkthvwltIfjfhkWJaBcPGrjYvQbQLfY7CyryOd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YentD+eD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EA4C4CEFB;
	Mon, 10 Nov 2025 21:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762809354;
	bh=nU1aN92dZSsCn1PBV4nnPJswWj+0MTQ5OdXs942PIhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YentD+eDy7OAdjdE3n2sK8qeegkkxq0IOhOOwOv+UBV1aIUKyNxBsBhiZ/GyGjmoc
	 qDZd+qNLTJH02E0cM0uciREeaPIZOr1J/sOETOvdHrLxmFnRNhzrEV58qSuRypo60r
	 kyCSW06aT0PCKv0nW96osos8Aegaif11Wm72wKb2tLEhS4NAkXtCHgfqub9WS7zM6c
	 snX2NsnmLmM2nCvFmL5yH2IbWS3Ums1RE10v/5JY/mg5eDKeNRaOBDNiV7njN4k3ah
	 97UVJ9luyRnMsM63qyMZZ1zLFIngM3XTMoie3sxH+o5KSaF5tznzoiTK9P7wITw1b1
	 w0zDMJMaZpFxA==
Date: Mon, 10 Nov 2025 14:15:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Graham Roff <grahamr@qti.qualcomm.com>, Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] Support conditional deps using "depends on X if Y"
Message-ID: <20251110211549.GB302594@ax162>
References: <20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com>
 <20251109232922.GA2977577@ax162>
 <82317993284703834a7b1d8d5ca05b7c646f2795@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82317993284703834a7b1d8d5ca05b7c646f2795@intel.com>

On Mon, Nov 10, 2025 at 10:48:59AM +0200, Jani Nikula wrote:
> "depends on A || !A" (or A=n) is the most common pattern in Kconfig,
> which literally means "depends on A if A".

That is totally fair, I did not try to actually search for the idiom. I
will say I do not find that either expression in Kconfig easily
translates in my head to "this dependency must be built in if the symbol
is built in, modular if the symbol is modular, or disabled" but I guess
that is just lack of familiarity with these idioms. I just want it to be
obvious to folks writing Kconfig when something like this is appropriate
to use but I guess with that being the most common usage in the tree, it
is fine as is.

I think my point about tests still stands, at least something very
basic.

Cheers,
Nathan

