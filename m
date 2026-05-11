Return-Path: <linux-kbuild+bounces-13116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RRB1BErJAWpsjwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13116-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 14:19:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BAF50D854
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 14:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43931300D1DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 12:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56EA37BE7F;
	Mon, 11 May 2026 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NE8Iccbh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9166537B018;
	Mon, 11 May 2026 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501951; cv=none; b=aFieJp4kLWtiLtXSk4HwwbndXFxbxEE34MxhGDkgoksYrF4p9XalFOMJmmDTr5pxX8YShguWePig/Cly+zriPM3EInLUCYTlQBks5lpeOyXGhfzwWJkOM94kUBz/++Yb8Fcl563zEMdUK/lFrF6kzXk3NrRdUac1np9+gzqfEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501951; c=relaxed/simple;
	bh=tLmLnG7NtRDvNzoHFnnr7G7EPjQ98zaD83MXtS3QGaY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D4H1DYQk8FAUBgwz3ni5PdCGGNThRTy6p9EUhZfmjbqo04TslhvAT87PAKRgC5qrWOlMhxWXaISKoQwKO+ULr9Eezw/wXaTQ7ianrIB0/+YhTCM2vQ2rau6kibNcDLx8bUCH/MthI/Ug0kpVP/APJ1NWH1djVOTEYiPpqG7hnlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NE8Iccbh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B1B3C410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778501949; bh=Zd6JYObStql70QlOFbbXZc/nE8PPz1FUhOYeRsnw8R0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NE8Iccbhlop5kx/SHt52Rf/geOduMGW0s25QzxYTEUHbOkhdbPL75cGB5nCBgnUio
	 1pSNbwEElvVuv2NeKLxoVtFifIe4xEigRVkh48eplDHFyEsqhWGLAKSd1uQsFnnlWk
	 hWMnXO1LkRUlwCipZJeOAMpBuWCtuwX/eVO/7We249wxaKgEsrDn+VsCrzq3Zt/BJi
	 YfslED0S1ywKWCAqGSGB+63OAvyGLWcK4ttKvxUJ1uXeHan8VURu5zqR8s5MtHpuhQ
	 vkWlLjWBWQ4m/IYIg3bPaOcYEatIgwvk/RaLkbxDF8DLgll1PeFdXk4yjxFYTbZeDE
	 V8grkQeZtgilw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B1B3C410B5;
	Mon, 11 May 2026 12:19:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Marco Elver <elver@google.com>, "Vlastimil Babka (SUSE)"
 <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou
 <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter
 <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
 David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov
 <dvyukov@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
 llvm@lists.linux.dev, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] slab: fix kernel-docs for mm-api
In-Reply-To: <afi0nQ84k1oz5RyH@elver.google.com>
References: <20260424132427.2703076-1-elver@google.com>
 <20260424132427.2703076-2-elver@google.com>
 <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org>
 <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
 <afi0nQ84k1oz5RyH@elver.google.com>
Date: Mon, 11 May 2026 06:19:08 -0600
Message-ID: <871pfiw343.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: A0BAF50D854
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13116-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Marco Elver <elver@google.com> writes:

> How about the below, i.e. adding type decls that only the kernel-doc
> parser sees? One complication is also DECL_KMALLOC_PARAMS, and adding
> kernel-doc parser hacks for that looks pretty awful, so this is a lot
> cleaner.

I'm going to be a while catching up with things, so this is just a first
take.  I strongly suspect that the people who object so strongly to
documentation markup in general would be less than fully thrilled by the
addition of this kind of workaround.  I'd like to ponder a bit and see
if I can some up with something better...but again, it won't happen
right away.

Thanks,

jon

