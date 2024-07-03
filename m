Return-Path: <linux-kbuild+bounces-2329-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0A924D52
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 03:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 975A5B21E90
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 01:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C959138E;
	Wed,  3 Jul 2024 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bbGavs5z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F7F184E;
	Wed,  3 Jul 2024 01:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719971552; cv=none; b=WmM8Eek9yNdTe2nyPuOR0hJHVYkSecvxTM1/ek5JcR1hM9oqQubDhh16qO4CpuTypxHkCKlMdQHappcDsoKm+kMUf86YbZedNoNdCAxQysCtx7NIAF65PBV2l9+vZ8mAwPftJ2PCEoBLOEPHKDiLmqi5LaA11tDD7F0+Z//zMeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719971552; c=relaxed/simple;
	bh=AZWnEmjzdfWx2rEuZ0R78NSu9kwChSrsvE3QFJGxMI8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WI2IcQWNrOLvmDX646ox8Mo68RZbi0Zl40/J9B0i195u35GP2mxJ8pBPiTN6iJlq0zNDenkxVMrTTbPYRyMQfhLkEkiYat0hdkH4JQCadmDXEye7x+CU9pwlCy6yYBMUT+n4EF8RQXZI8qfhmUsaDLgiJJSJQre1iMC+8WouhtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bbGavs5z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C22C116B1;
	Wed,  3 Jul 2024 01:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719971551;
	bh=AZWnEmjzdfWx2rEuZ0R78NSu9kwChSrsvE3QFJGxMI8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bbGavs5zhgvk1NpdDqPFgLRXysqzzXjwo0MP2nqM0/j17Oj0Tds1PmE2+dI72hLL5
	 wRlzl7Kjj6hulYC6F8xO7cDuhzwo7xqEyrxRZ8b1ooGll23gCyvAEchR5+xHmY5gJ0
	 26tWGWtqveKyi4RaZURe4w6nKVrua89Uvf78uueU=
Date: Tue, 2 Jul 2024 18:52:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/3] modpost: .meminit.* is not in init section when
 CONFIG_MEMORY_HOTPLUG set
Message-Id: <20240702185230.9ff500bf6a89db888207f8f1@linux-foundation.org>
In-Reply-To: <20240702234008.19101-2-richard.weiyang@gmail.com>
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
	<20240702234008.19101-2-richard.weiyang@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  2 Jul 2024 23:40:07 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:

> .meminit.* is not put into init section when CONFIG_MEMORY_HOTPLUG is
> set, since we define MEM_KEEP()/MEM_DISCARD() according to
> CONFIG_MEMORY_HOTPLUG.

Please describe how this changes modpost behaviour.

Something like: "we're currently not checking for references into
meminit and meminitdata when CONFIG_HOTPLUG=y, which may cause us to
fail to notice incorrect references.".  But I don't think that's
correct.  So what *is* wrong with the current code?


