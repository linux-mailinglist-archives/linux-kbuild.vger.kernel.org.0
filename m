Return-Path: <linux-kbuild+bounces-6504-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 919A6A7F303
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 05:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5EAC3B49A2
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 03:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD121AA7BA;
	Tue,  8 Apr 2025 03:04:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20C53FB1B;
	Tue,  8 Apr 2025 03:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081473; cv=none; b=oIXPlrkQCc6KnQX3M2FqZ9Ls92MhhUGaJz6nuaX4ZaVKXdarja2ggrfeT2sXiep2z8phTiYAsBwZueE+3qHlKFLGOivmkfdkoLg6ixAh3tG/bZCZuUYATDIyhjsmTAjhu8cWhh+u6vPfbpStL7JI37DlYN0GQqj8TsowmQNSCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081473; c=relaxed/simple;
	bh=VfnRq1oKSfUnhZQg4yKYM/OaeRV0QmfAoOuhpbQZ6dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IA7/g0uhtTO/vfiOcR691YKOMYEY8+shOrTQv9hxzgOwAH402mQrMbThHerjL724bL0hHYvAVSNp9N02gjQtTyAqADCXKl7Mk6tG1BpWxnt7VnZsy481yU/m2stOqxhdP7xPIoyBnoLgMjCQvBls/fR1lsWdMdaA2GkJ/zNC0qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DF37234307D;
	Tue, 08 Apr 2025 03:04:28 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dwarves@vger.kernel.org,  da.gomez@samsung.com,
  linux-kbuild@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-modules@vger.kernel.org,  masahiroy@kernel.org,  mcgrof@kernel.org,
  paolo.pisati@canonical.com,  petr.pavlu@suse.com,
  samitolvanen@google.com,  Matthias Schwarzott <zzam@gentoo.org>
Subject: Re: [PATCH] kbuild: Require pahole >v1.29 with GENDWARFKSYMS and
 BTF on X86
In-Reply-To: <7b0bd9be-c3ef-40d4-9465-92f3e69a07d1@oracle.com>
Organization: Gentoo
References: <87o6x8idk1.fsf@gentoo.org>
	<7b0bd9be-c3ef-40d4-9465-92f3e69a07d1@oracle.com>
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Tue, 08 Apr 2025 04:04:26 +0100
Message-ID: <87semj4amd.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alan Maguire <alan.maguire@oracle.com> writes:

> On 07/04/2025 09:25, Sam James wrote:
>> [with regard to
>> https://lore.kernel.org/linux-kbuild/20250320232757.2283956-2-samitolvanen@google.com/]
>> 
>> Would it be possible to have a new release with that fix, to avoid
>> distros all having to cherrypick the fix commit?
>> 
>> Thanks in advance,
>> sam
>> 
>
> We're planning to release 1.30 shortly to follow the recent 6.14 kernel
> release - hopefully this week, or perhaps early next week if any bugs
> are discovered during final testing.
>
> If folks can help by testing the next branch of
>
> https://git.kernel.org/pub/scm/devel/pahole/pahole.git
>
> ...prior to that, that would be great. Thanks!

Will do, thanks!

>
> Alan

