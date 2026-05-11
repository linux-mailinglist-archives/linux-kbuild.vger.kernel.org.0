Return-Path: <linux-kbuild+bounces-13115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHZ4GaDIAWoRjwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13115-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 14:16:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B455850D79C
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 14:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F64C30990A9
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 12:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9D939E19A;
	Mon, 11 May 2026 12:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibjbkZwF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A52C39BFF4;
	Mon, 11 May 2026 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501270; cv=none; b=nLI9DoyuRD3nsEsbilMraOk6kLJfkvh8F841aBIk1k3qfT3cihS4vBY/bBuoADSLb6Puy7gtrAc81U9HHQs1QtbV4QT0p5pHif+bIVbZLet1pBEuVyGn+fzw/PLjy4mECJD7huTMm6G4k7Z7tIVBob0OTihfdglPhWd01CKi3WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501270; c=relaxed/simple;
	bh=XJZrn11TDzQfh5nANwCT6M8kUFD6U0DGy379pNKKf8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mg9fcS6WvDVxynPWNywnM5y/7+ZsNVVbDT3TYtfP07C28LYx7qr2XZ4cJwEGI2m99vNkQnmM53HCpKaXdY6CtEE4QxjPI/qU4WVD2S2KTfEmtJI5SuNflPPK0/YJE5ws3DOmTkYoSMCmpEphxmzNXZkLcOLLir/TkdLKVSanRN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibjbkZwF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A12C2BCB0;
	Mon, 11 May 2026 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778501269;
	bh=XJZrn11TDzQfh5nANwCT6M8kUFD6U0DGy379pNKKf8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ibjbkZwF2wXnJAldnE6kmyyqGGSID2Bc9jjAZ7CmPnbHIpPK9V5MhJnkkssrsla5M
	 TCEnI1WgfWvVs/1fjjPQ7XcqEoTa/hK5QEXzZpxjHsrfJdUtL80tdnk9GPBLcaNNUh
	 Dz1VrECQFTWep3M2pb7EfDNqTCG/s4CaVghUsLmw3JrSmqNDgUIPL5j7Lpyfp7m8YW
	 q6DoQtrE/id+udKogPXf4b1Yyf3etERPPuZRYII2z4tRvKYkHMhIVv2JaD3xRIUH9X
	 LytFu1InWXDWc50X86CajW1gTwTUSZ2HboiZXGVlEjmld61KcI4RsqaNjC9EwSIS/6
	 KIIoWzhQRPkuA==
Message-ID: <8354c3ee-85c0-4765-a114-20f350ae6e65@kernel.org>
Date: Mon, 11 May 2026 14:07:41 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] slab: fix kernel-docs for mm-api
To: Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>,
 Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
 llvm@lists.linux.dev, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260424132427.2703076-1-elver@google.com>
 <20260424132427.2703076-2-elver@google.com>
 <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org>
 <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
 <afi0nQ84k1oz5RyH@elver.google.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <afi0nQ84k1oz5RyH@elver.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B455850D79C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13115-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/4/26 17:00, Marco Elver wrote:
> On Thu, Apr 30, 2026 at 03:59PM +0200, Marco Elver wrote:
>> On Thu, 30 Apr 2026 at 15:40, Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
>> >
>> > On 4/24/26 15:24, Marco Elver wrote:
>> > > The mm-api kernel-doc comments have been broken for a while, as many
>> > > documented symbols shifted from being direct function definitions to
>> > > macros wrapping _noprof implementations during the introduction of
>> > > allocation tagging (starting with commit 7bd230a26648 "mm/slab: enable
>> > > slab allocation tagging for kmalloc and friends").
>> > >
>> > > When the kernel-doc block remains above the internal implementation
>> > > function but uses the public API name, the documentation generator fails
>> > > to associate the documented symbol and generates warnings and fails to
>> > > emit the documentation.
>> > >
>> > > Fix this by:
>> > >
>> > > 1. Moving the kernel-doc comment blocks from slub.c to slab.h, placing
>> > >    them directly above the user-facing macros.
>> > >
>> > > 2. Converting the variadic macros for the documented APIs to use
>> > >    explicit arguments.
>> > >
>> > > No functional change intended.
>> > >
>> > > Signed-off-by: Marco Elver <elver@google.com>
>> >
>> > +Cc Jon
>> >
>> > I thought it was supposed to work because the kernel-doc scripts were at the
>> > time taught by commit 51a7bf0238c2 ("scripts/kernel-doc: drop "_noprof" on
>> > function prototypes") to handle _noprof. In the current form git grep finds:
>> >
>> > tools/lib/python/kdoc/kdoc_parser.py:        suffixes = [ '_noprof' ]
>> > tools/lib/python/kdoc/xforms_lists.py:        (KernRe("_noprof"), ""),
>> >
>> > Doesn't it work for you then?
>> 
>> Ah, I see. So it doesn't work anymore because we add the '_' prefix, too.
>> 
>> I guess the question is if we want to proliferate more kdoc parser
>> special cases, or just move the docs to the macros. The downside of
>> macros is that they lose the types in the displayed function
>> signature.
>> 
>> Preferences?
> 
> How about the below, i.e. adding type decls that only the kernel-doc
> parser sees? One complication is also DECL_KMALLOC_PARAMS, and adding
> kernel-doc parser hacks for that looks pretty awful, so this is a lot
> cleaner.

Looks like a good workaround to me, unless something gets confused by seeing
both the declaration and the define.


