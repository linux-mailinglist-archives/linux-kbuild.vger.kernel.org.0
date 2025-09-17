Return-Path: <linux-kbuild+bounces-8836-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 933EEB7EDD5
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 15:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E6BF3AA5A2
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 01:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E95420F08E;
	Wed, 17 Sep 2025 01:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsMqvpXZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FADF1E492D;
	Wed, 17 Sep 2025 01:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071417; cv=none; b=IYe3l/zIbnfemJS7iEvhlYAAqysOEU3SZObS0+Q9Z2zFNM4bQeHk2Fjv5mBfq4jNFg1gyXAOlXU1gntwFtrAWWlBd4DhGN0Jycik/Ls59NFntOmFpPoTEKhqI2//kMqRD4Hkw6/2gUDqboXUygiZ26pmO3KxfUJfzaOG+IG0GZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071417; c=relaxed/simple;
	bh=LL76ArrrsiFpqVUCODSJD4MmtjtQi3bd2ibzdYJEqik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jw+EICrFHDYSTASIvTKUaWrdCE5bthA9dIbtazhPb08enJ0vD7hb3qljjDwAP0WTcJpzVzdjtlCdNvmIwffMO0T0U7988PwN2OwDNfal/GApP3f0ZCX7bEPOr23l7Ws4Tnn3VQwMhLWnWaFd2RiaNe8DRgkP2F83HDkiVlrYgJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsMqvpXZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53C4C4CEEB;
	Wed, 17 Sep 2025 01:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758071415;
	bh=LL76ArrrsiFpqVUCODSJD4MmtjtQi3bd2ibzdYJEqik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsMqvpXZ0okOIV2OfZBtVU4WNIH9MdiXwaHnWRMK+qzsYAb4BpLMG6e71KRtyiC06
	 M2XUTC4PqkF3xYnb0AExUaVHxlOR8bj2mgeGLSoYUKigcNrs+zn7lcnQCMYfXnj+2H
	 cUiUa+jolbD/AREYQ/elrPyFansBzi4fv/DL5+0+Gz8dCcBbtsP1TIO3UxvYHv+rAP
	 w+Ury2NY2zr5C/hfZIAvRHdgNMlmVI/UI0+biYBCa6Gu1v/CmKEWcLbBllvRB1XusO
	 EzInOFqbtSuzYTAp4EvRRngKthT6gvGnriTvOEuenBgLTf/VBQeLi8q22ttQfriQtG
	 9iNUkaAWccJaA==
Date: Tue, 16 Sep 2025 18:10:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v7 3/8] kbuild: keep .modinfo section in
 vmlinux.unstripped
Message-ID: <20250917011010.GA3106929@ax162>
References: <cover.1755535876.git.legion@kernel.org>
 <4d53c72293d88b663257a0d723ebf3473a08b374.1755535876.git.legion@kernel.org>
 <aMeqgPVfJcjBLhl8@levanger>
 <aMkN1m55vejTii_H@example.org>
 <aMkvtg55F1gJ5feM@levanger>
 <aMlKTPpNXrRW6v_7@example.org>
 <aMlbSEnwGOPM39Op@levanger>
 <aMlgMkB2nL31K2OB@example.org>
 <aMll6cHPhIY2yswz@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMll6cHPhIY2yswz@levanger>

On Tue, Sep 16, 2025 at 03:28:09PM +0200, Nicolas Schier wrote:
> yeah, it's actually because I dislike modifying vmlinux.unstripped in
> the vmlinux rule.
> 
> But it may be that Nathan does not see it this way.

Yeah, I would agree that it is good form to avoid modifying the inputs
of a rule.

This warning is pretty annoying since it is intentional but we do not
have great tools to hide just this one instance it seems... This is
probably worth a comment.

It would be nice if this section could be marked as NOLOAD from the
beginning but that will mess with extracting .modinfo via objcopy from
my brief testing.

Cheers,
Nathan

