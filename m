Return-Path: <linux-kbuild+bounces-4999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467C9E48B2
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 00:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 011E928116C
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 23:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A109E1AFB36;
	Wed,  4 Dec 2024 23:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQcZEzsK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7998619DF66;
	Wed,  4 Dec 2024 23:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354595; cv=none; b=WQ63nA9fDxF8G3Mf4AUCTtbjg6I3/5NlIjZyDxwgPR3sq6DnC0zVbq0pQ3M+Jl1eXrGgVBI91g4y1oO4qzCge0IOfUP6MR0RsWCqNfuDgduhmDkpP2NkGP1ZtNnwZ+xb0F/qzlj4cCCO4aMbjy+JgnLQgdMEQg1ZUgo9KHKZuCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354595; c=relaxed/simple;
	bh=8+S1s/Z+BtmHUN7KkjMeVX3VgYgA5FzlfPN/A4NxXgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0beqxMOyPcK4kLXD29FTFmvtwnPmGgD9hW1VvA9arfb7Jjo2StYEEu/L7K8xxW5fUaWTuQfoOrqW5SbSFfEPIq3Dpa9309GxqYtuM7EgQe3JRiSDk5lBvJZHi1K01H2UyptDym6CR25b6+S7RSbePfVdi7pPPTuyxhbwqM/7jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQcZEzsK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4A9C4CED2;
	Wed,  4 Dec 2024 23:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733354595;
	bh=8+S1s/Z+BtmHUN7KkjMeVX3VgYgA5FzlfPN/A4NxXgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQcZEzsKZGPjSb9or/HZkcFMGXZnGpmzCRJ1I/cFg5kcnKeiLH5K0Uw58cM36NRv0
	 P183fANxzq+dC9u5/keg5DSYGRiVISJvHX/r52mS3adJD3sI8pIz/0q2tET+Yqe73X
	 0rS2gYU87ODla7b2Ku5fcbvKxfVfcR+/mcCihRsk0plnqUhrxL7tcAhnYNgcjahjSf
	 Tctd2f/gxvFNu4aZNHZWFq/v9seKiwZ8K+8tFe5DZgFC8UvZXuqo7QtftMnJhzC74b
	 Gv0mgw4GXH4Tg+KCEqgOo1qxpsLHi0dIsPXZoo0TqjjiUAL6GrwnZcjlyAnFgHu7WY
	 4lrXabzOaYBnA==
Date: Wed, 4 Dec 2024 15:23:13 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de,
	thorsten.berger@rub.de, deltaone@debian.org, jan.sollmann@rub.de,
	masahiroy@kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH v6 06/11] kconfig: Add files for RangeFix
Message-ID: <Z1DkYaxnHwKUocE4@bombadil.infradead.org>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
 <20241028034949.95322-7-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028034949.95322-7-ole0811sch@gmail.com>

On Mon, Oct 28, 2024 at 04:49:44AM +0100, Ole Schuerks wrote:
> The algorithm RangeFix is used to resolve the conflicts. This is the
> implementation of the algorithm.

The subject is more imperative and clear, just say something like:

Add files to implement RangeFix, an algorithm used by <foo> to do
<bar> in subsequent patches in order to support <whatever>.

  Luis


