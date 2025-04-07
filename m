Return-Path: <linux-kbuild+bounces-6482-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600A5A7D7BB
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 10:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE6F33ACA3F
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 08:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC2C22687B;
	Mon,  7 Apr 2025 08:25:09 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EF6366;
	Mon,  7 Apr 2025 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014309; cv=none; b=fMd1Z9zZ94MrPnIceyv091cB5NH2rUI6VtrVjsoPH5yIeWr3cPqjBWVFo6EaXB2u3JIakg4KhW3APvNPlocCcChDkdlSl9q/YgHZ3eQW4wY3wHhTFBelW6HocIGJUeAIpXOfur9b0rL2xDKevC6qV2pPgNJbuCDKqoON2X0env0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014309; c=relaxed/simple;
	bh=G4NZGcVRdsrS995DEJCA+nbC8NIBsF/Rc4+h6bydGFU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=d3YlUtczmrsBKxBTFfbZqykz7F0z8ZDfrsZ58fGQJ+lJLqo3pd4YARd5iQTydh21KmYxOZ1xlxaCa5WpLlmT2ZxY1pqIJugtudLm55NupVV3Z41SZX5su/T0yv08d5HqzMpf/YIwCncjWrvOV/4X5/xdL+pz2t8FqsFPzKlH184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5568533C84E;
	Mon, 07 Apr 2025 08:25:05 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To:  dwarves@vger.kernel.org, 
Cc: da.gomez@samsung.com,linux-kbuild@vger.kernel.org,linux-kernel@vger.kernel.org,linux-modules@vger.kernel.org,masahiroy@kernel.org,mcgrof@kernel.org,paolo.pisati@canonical.com,petr.pavlu@suse.com,
 samitolvanen@google.com, Matthias Schwarzott <zzam@gentoo.org>
Subject: Re: [PATCH] kbuild: Require pahole >v1.29 with GENDWARFKSYMS and
 BTF on X86
In-Reply-To: <20250320232757.2283956-2-samitolvanen@google.com>
Organization: Gentoo
User-Agent: mu4e 1.12.9; emacs 31.0.50
Date: Mon, 07 Apr 2025 09:25:02 +0100
Message-ID: <87o6x8idk1.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

[with regard to
https://lore.kernel.org/linux-kbuild/20250320232757.2283956-2-samitolvanen@google.com/]

Would it be possible to have a new release with that fix, to avoid
distros all having to cherrypick the fix commit?

Thanks in advance,
sam

