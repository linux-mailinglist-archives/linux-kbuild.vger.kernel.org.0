Return-Path: <linux-kbuild+bounces-3036-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11806954276
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 09:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4514C1C229D2
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 07:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120E884DFE;
	Fri, 16 Aug 2024 07:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LpKfaihC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21A978C68;
	Fri, 16 Aug 2024 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723792447; cv=none; b=HQO63Gd1hKqi3IbvU7nwOvO9CRPBjHK1atyHhnUlawsXg0lyyh2KdGyaFaD+G4YbzY20sUWe/9/uQvxvbxKlVu3uisolp+QltWZBBWGH18RM0TRmUGb+6gYE25lAkbpizIesyHJ7uj8JunHccaubPr9svBfteGngP3RzH+egWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723792447; c=relaxed/simple;
	bh=D0+HGB7x2+EU9kTyZqyNjrkHZaMRg8XhZjV6j5p3NCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1Uzd893UHRsqAnZOIqlhLwbuKw+s++dTN3mKGSmfcm7xsm8FjN2nsE39JQqhFhLJBuvxA/CPjmpzguVYWJOKb7bpWEFEuC/CbwuQzG0IOAc+MAmBqn//VY3+cf3+esWlcO1SkVqjX1b+Q9RuQDfok1fPvEQO4GkHrf3DO97lrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LpKfaihC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEFCC4AF09;
	Fri, 16 Aug 2024 07:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723792446;
	bh=D0+HGB7x2+EU9kTyZqyNjrkHZaMRg8XhZjV6j5p3NCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LpKfaihC58yOrhhZ1550lMcbezhcNtEhcX/VQ6AA27NhoZYb6NDP/lFBgD3W8EsVc
	 2i62HQExDs525PJExjmob2RYI1R/kauniQEfXLxi8d9KVybKqQ34gqccJ2zsHVYQzr
	 b/RGRcEEyx20/2pGZ0W9BRu67U1tGNCbKYii6Jz8=
Date: Fri, 16 Aug 2024 09:14:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
Message-ID: <2024081603-punctual-hamlet-152e@gregkh>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815173903.4172139-22-samitolvanen@google.com>

On Thu, Aug 15, 2024 at 05:39:05PM +0000, Sami Tolvanen wrote:
> --- /dev/null
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

Sorry, but I have to ask, do you _REALLY_ mean "or later" here and in
other places in this series?  If so, great, but I want to be sure, as I
know:

> + * Copyright (C) 2024 Google LLC

Has some issues with the types of licenses that marking will cover.

thanks,

greg k-h

