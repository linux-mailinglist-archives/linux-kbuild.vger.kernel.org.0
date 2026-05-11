Return-Path: <linux-kbuild+bounces-13108-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGVNDTOmAWpDhQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13108-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 11:49:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB8250B4BC
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 11:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B52E83024A1B
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 09:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089B03BE62A;
	Mon, 11 May 2026 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ITVxMv3h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E783BAD84
	for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2026 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492132; cv=pass; b=GGSrs7fu+Hp7Xu/s6qdl/WMC2TYBziZPUJkP3HtmZ40JvqL2J0YnfwmLhgcWw09r8LUbh9Y5BnQarSBXL6wV5rC2Aq1z6UmM3Gw1ECO1H0Nck8KaMIXr6rUWaBXvGgMdQbj3u5qTodVV8gcow6j041k5s57uGi8wkvx4Rwb6Xns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492132; c=relaxed/simple;
	bh=NRMFgXt/+8/VoEquamZsaZxYeYlqHmrVJp607sf0pRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCm6G01bHidEv6qmp31xHNCb+rWZ8EQweyVEVFr/l0/PJ5CQ1awpodppPs/KwqxXcwt0HX3qyL/C4s0ivmjiDS+4ol6+ZvglS1Wrj0vScfX7QQVM8CXw/mjZ9edpSmhh6J/eAl0I5QWkGjIgL+y8wxGMu91kOYkRdiwUyHcurRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ITVxMv3h; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1332772f6b3so176959c88.1
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2026 02:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778492131; cv=none;
        d=google.com; s=arc-20240605;
        b=l0XXFhh1/NB6y5NXELbLxBCRtrroEfh6XMGd1VpbIJfw6fZiC8uVCfgaqkm84XZ5Oc
         PxMk+B8FmoyUzEZsnMRTJ1Ljn9BPGadpemz4C+Aw6SL6n0pZnEUsbYCKvYGMVWM+e7FY
         dtGL2xTosUJbzN3v1SzZEC+rMAidnr56hkUOS0pxcNjID2SkVtNMd6cFrZ+zJANX79lp
         b6v3QeWZkjG+CMkoBMHBiM1ka4HMA9p2Mc+eOw7WOhaOr5vZcZtEJGydhxw1cHw53LWv
         G8OD8J/OzpxHSsIWJyIqhXwtDlfcXJM2j5SOGUAqKq1FcZF7q2JfoaNFBqS/1EA8g1mU
         c7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WufxmpQiwhOpJBofeZI+ZtjHioGWCbMxkve0DPKIOFk=;
        fh=PHIIlTzvLxUo4EFSSHwm0iho1JVdjEmddOnif9U/0ZQ=;
        b=hwsgtFmdzxSEVK7iLlIWbP7gHHxvmq1S4LSX8ZrnZLJa09VGQhZEVQVKEL2wkB+xg8
         /tml8M2HLvjyCfM2C8sdKigg8MMmerxPHWmkh0T5mZQSSYrtaYvMsssNGXTjvbZnOsKP
         aZpg7pzajc+SdPig0UrMLjHjOlvxz1o+iRuaJiCfGQSYJIUGQpBAVuyDuRJ9A3RAepA2
         Z+5/zLC6dl1ItaaMl0PhtBUGutnR7gHvmSsjImuMF+j0IbEenXDGYn1t1HmHFMsI4bEF
         uL9+udB95QxkXeRvoeyXSFhxM3FXFn/nErG8f/qI5zLOBQAWkLIDmUeWAiUGJNpS29PT
         xIBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778492131; x=1779096931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WufxmpQiwhOpJBofeZI+ZtjHioGWCbMxkve0DPKIOFk=;
        b=ITVxMv3hFSAZRSttPQoavQwmAHtsm5g3UKh0QsvJuUNcKzTefrB8UBmodd4CAP9e5A
         tD+Ru8FKuEo0sE82QGmQq6nEpVruQNIZo4xMc1TX96SEzEfbdmezUAvuSqSWZMICQv/B
         eRQ3DBT8QNtVwppwGxuygm5M9pV2VR/Myfk8b7K0BpkhI9qUAF1wkT3fPN4yJTgD0zkG
         MI4ieywI8nGj0LlofybfDUPLtELCJKEDFtFSdNzxIR8Onm1/pzz5rC+gxa/reC4JR5QU
         Ue5w7tGyzNtEAe8qPVmMJtHS5HtOR9A8dMeDMZUnKLtsIgxMkoE2/VKF4pyaZHnLLB0f
         ygmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492131; x=1779096931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WufxmpQiwhOpJBofeZI+ZtjHioGWCbMxkve0DPKIOFk=;
        b=k6SHps6AjrYJ3oTQdHx8WVLUYg8hjz45b6wVR8YzfaAGqxhC89PccmV4/vouYsMCVr
         eAZvWHVX7x/8MN73EcQZC8+d6VFL+/UExmJCUPk6wyffgeDAyCzk52h/FI5vAxe7mkKx
         OEh9dbevgmQe8/cZmiccSWUZZDULs5LdE5A/gVpWOqxEqJOtTZDwUBeCx1nqbsvw1Ccg
         LQt75nLRBtkShvKwEZMunl14TOsunKc42pH/Vd8XFSKS5IKFIGSZzrAfFESEdOmqFpa4
         mKCGDLcz+n7C0KAwB2UwSJPutuDpuz+2YGZ9Uvn5q+vO5YbTRWyCk4kapnUioftqUKyJ
         7OSw==
X-Forwarded-Encrypted: i=1; AFNElJ/IiZYDN88VByEMhTKE18UwoH5O+7cD2wUHXd1/AMD2C2x8iybJArEPP+EOcxy82oGDnjyDtbfUCNKhkv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6xm7IpPY89P5cqycwfU+Go+KD/myssuwlvNE64lv7LLvuLyg9
	y0mC+MjEj/EEa3Oqal6+oL5sl28ox2nQq+CENVCge3hb0/q1Buqqd5YagZ1mdGWdtP/IBlUwcxY
	5SR+ajvdrpHsvl4FT7l7pr4S/X8bZEXcvMpDmeJzM
X-Gm-Gg: Acq92OH5dVV1JwvfHYCkKyzJwTm+G/ycKVeJIdJrajK+pAcrW2OZHYiTzH3HSbBpsna
	7SgTEQYRXPUrzn8L3lLYwk3qhF0gcSK0GeU97/FFlcCqqSdjGoMvDugKqDVRISPlXd3kUNhUdMR
	kvRAovMGz18lISoUCuW/nZ5Z9G23h/Qh561z1+gN2UkjBuzaDzbSX+HVHYixKVQ1Zda81dU6ZEh
	y4gaaHfVcPVY/NaHxTXCiulX3WtnHVg4hjoC1c+LxbIMvFzscOh5kDLNF+3cpvHbA00XCZR3cFZ
	T8CaNRYxZRRzSO0Goh9+4XOMfL8fR5kyHZsFC1Ic81AzPcK6ZA==
X-Received: by 2002:a05:7022:6184:b0:130:ac5d:8f69 with SMTP id
 a92af1059eb24-1318ea1fdd6mr9371056c88.30.1778492129711; Mon, 11 May 2026
 02:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424132427.2703076-1-elver@google.com> <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
 <afkOMIPu1WNFE9MS@elver.google.com> <CANpmjNM261J5qefMvmUXWZGBVz-KBs7GkbpdNMfTOvNJ-=LiZQ@mail.gmail.com>
 <afz7pZADZPD4mKJr@MacBook-Air.tail10959e.ts.net> <af3xcFjrZSZFG846@elver.google.com>
 <rz7dt4wghum6beghfgm6suqje6jeivrensojjalfis5zeuyen7@6bj7kfpqb4q5>
In-Reply-To: <rz7dt4wghum6beghfgm6suqje6jeivrensojjalfis5zeuyen7@6bj7kfpqb4q5>
From: Marco Elver <elver@google.com>
Date: Mon, 11 May 2026 11:34:53 +0200
X-Gm-Features: AVHnY4Kqj_o0gwegpds4LdAczqxNps8c5-uDjsqJAwkE704552pC9-_A9oEAMnQ
Message-ID: <CANpmjNNevjTo0uwo3DJdDc=PpQpyzj301kFT39OBoCNLW0A8VQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] slab: support for compiler-assisted type-based
 slab cache partitioning
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: AAB8250B4BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13108-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,googlegroups.com:email,gnu.org:url]
X-Rspamd-Action: no action

On Mon, 11 May 2026 at 10:31, 'Harry Yoo (Oracle)' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Fri, May 08, 2026 at 04:21:36PM +0200, Marco Elver wrote:
> > I think I have a solution for this mess, see below.
> >
> > I would not send it as 1 series, but only include the slab changes (+
> > instruction_pointer.h change to introduce _CODE_LOCATION_) as one
> > series, to go through the slab tree. The rest of the patches would go to
> > respective arch maintainers.
>
> I'm assuming this will be a follow-up and reviewing patch 1
> (and waiting for Jon's thuoghts on patch 2)

I'll be sending v4 shortly.

> > diff --git a/include/linux/instruction_pointer.h b/include/linux/instruction_pointer.h
> > index aa0b3ffea935..dfe73aafddb8 100644
> > --- a/include/linux/instruction_pointer.h
> > +++ b/include/linux/instruction_pointer.h
> > @@ -8,6 +8,30 @@
> >
> >  #ifndef _THIS_IP_
> >  #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> > +/*
> > + * The current generic definition of _THIS_IP_ is considered broken by GCC [1]
> > + * and Clang [2]. In particular, the address of a label is only expected to be
> > + * used with a computed goto.
> > + *
> > + *   [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071
> > + *   [2] https://github.com/llvm/llvm-project/issues/138272
> > + *
> > + * Mark it as broken, so that appropriate fallback options can be implemented
> > + * for architectures that do not define their won _THIS_IP_.
> > + */
> > +#define HAS_BROKEN_THIS_IP
> > +#endif
>
> As long as _THIS_IP_ is broken on some arches, it cannot be used anyway
> when in a general API that can be used by arbitrary users?

It more or less works today, and for debugging or tracing it's "good
enough" in most cases.

The plan would be to phase out the generic _THIS_IP_ once all
architectures have a correct _THIS_IP_ implementation.

> Is it something that can be fixed in all arches over time?

Yes, I have patches for that.

> > +/*
> > + * _CODE_LOCATION_ provides a unique identifier for the current code location.
> > + * When _THIS_IP_ is broken (generic version), we fall back to a static marker
> > + * which guarantees uniqueness and resolves to a constant address at link time,
> > + * avoiding runtime overhead and compiler optimizations breaking it.
> > + */
> > +#ifdef HAS_BROKEN_THIS_IP
> > +#define _CODE_LOCATION_ ({ static const char __here; (unsigned long)&__here; })
>
> Nice!
>
> Yes, we don't really need the exact code location
> for partitioning kmalloc caches.
>
> IIRC lockdep does a similar thing to define lock classes (unique for
> each lock init location)
>
> > +#else
> > +#define _CODE_LOCATION_ _THIS_IP_
> >  #endif
>
> Probably we don't need this fallback?

x86-64 is the only arch that has working fast _THIS_IP_, and adding
static __here markers to bss is rather wasteful.

More architectures will be supporting _THIS_IP_ properly once I get to
send the patches. The mainstream architectures all have a reasonable
and fast way to get the current IP, so we don't need to waste bss
space there.

