Return-Path: <linux-kbuild+bounces-2004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F218FCF69
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 15:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9B431C24636
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 13:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C261E89C;
	Wed,  5 Jun 2024 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qezvL5L+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F40197A7C
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717592853; cv=none; b=r0Wpl0NMwRs5Y49oexWiXLK8ljZESwNwqHVNqrOq/k7eX4gL+dAoNwDjontRQ3ZoG/GwvG1gWEG6Fzi+eUJTaJb465Vp3Z/FPXtRFxzSt7p2+xsvZz0hMT2D0rsQwQnhL31Dyoygtr3J5pBCafLKpT+6ethtwJPn8fe2o69GZ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717592853; c=relaxed/simple;
	bh=qZHkEQ++7tVEI9A8+F4KvpoST8oIUTfoo0k1QMfUSY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qz+Hp2zmNGZMNT5wzUTGGejiXg+afzyL0nspCNb/y9qdDRw8hOzB7qJT2DvRlB07WhRx5D7963AVQ4GoAJ//4weVP/+1pF5brc89G8cEVWrkA1nHEh2Oxl8vCUWkn4WzAhB9wDa2hmowalp0cEA/3vG8Sgn03VivuVBYuzke6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qezvL5L+; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: masahiroy@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717592849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCz6SnRGCIiQriwXJWXeFoRjjdnojiW2ACa5jRM7Xlg=;
	b=qezvL5L+vk0q4x6u75uuDTYm5NB8FYeO8WhI4X7FnLGvN2ZIOofuLMrmXQGDz1r+GuyBcD
	3HK+waps5icZj1pB+I7rpTwFZuxEj4kbirqYuLTgM24g+mqOqKhZAaRMVd2iJ+hbACqKKy
	v4z6BbGjSJaG0Uul4FqGY8l36kd0C8I=
X-Envelope-To: mailingradian@gmail.com
X-Envelope-To: nathan@kernel.org
X-Envelope-To: nicolas@fjasle.eu
X-Envelope-To: linux-kbuild@vger.kernel.org
Date: Wed, 5 Jun 2024 09:07:26 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Richard Acayan <mailingradian@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH -next] kbuild: explicitly run mksysmap as sed script from
 link-vmlinux.sh
Message-ID: <lvr3d2maqln56lxzqvubj6jfeadjjgvro74x5m7pyb56rhgeus@dt64aothn6ch>
References: <20240605034903.373617-2-mailingradian@gmail.com>
 <CAK7LNASjUesga5pwtaV9aRd_MG7infjistFTsSWbvMpytggaEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASjUesga5pwtaV9aRd_MG7infjistFTsSWbvMpytggaEg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 05, 2024 at 10:05:22PM +0900, Masahiro Yamada wrote:
> On Wed, Jun 5, 2024 at 12:49 PM Richard Acayan <mailingradian@gmail.com> wrote:
> >
> > In commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed
> > script"), the mksysmap script was transformed into a sed script,
> > made directly executable with "#!/bin/sed -f". Apparently, the path to
> > sed is different on NixOS, fixed by using the env command.
> >
> > To accommodate the number of arguments above the normal maximum for
> > hashbangs, the -S flag of env was used (as in
> > "#!/usr/bin/env -S sed -f"). However, env -S is a GNU extension.
> > Explicitly use sed instead of relying on the executable shebang to keep
> > compatibility with build environments using Busybox.
> 
> 
> I am fine with the code.
> 
> Kent will drop his local commit, so please reword the commit description
> without 973eca8db557 in mind.

Sorry for the hassle - glad this is fixed

