Return-Path: <linux-kbuild+bounces-12950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Baq4Eopg82ks2AEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12950-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:00:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F338C4A3C85
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A3A330046B9
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 14:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEC2429838;
	Thu, 30 Apr 2026 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0tQbm9B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFE429823
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2026 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557633; cv=pass; b=CQfOz4sIoED794JzmIvhHmLGze3JV/VYmx7hCg3yU1wMvSH7spYPQVL4kScoqu4egLTU2Pnz9KbtkCVRqV+raGPKSZjJf5GEJDh5T4fUqV/IfBQ7AkkT9BWw7AVF6JCdmwKZvFkVB2299EIu6QE0SuI5CzX6SbyI0X2ctfa9+ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557633; c=relaxed/simple;
	bh=q11TjLbVvV8woWQJHWB4Pgl2P7O1TL92s7zig4m0+0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5yjbXcCAvO2HkQYxwYygZ/y0fjmRLCbq+5hnz/CDSL400XcAb7hggiYgeUaLwK4IXndgbjdq8F/NIiofCzruor6WWdkAKcbLJqCJnRqLQl1S9hqxTeUUEqlpqenS4sZDkr04PGUdWevRpXwg7nx1uHniMwxYVTj1psUQF/vpf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0tQbm9B; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c88e5f4aeso675501c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2026 07:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777557631; cv=none;
        d=google.com; s=arc-20240605;
        b=eNrYbqjuw7xPAqgEL2LS5gohG78jA36LKF+AXZiOpeblYnL+6PRqF5e1yMBxr0RNkx
         BsHeZHlEIxwavJW0VD/ifzNCThGC1Lc7AmcmPU8JAnp+/AiUdklj7izEy4nTffwfNQp+
         ngvPLb2G0MF6s73LGiZh5qbYev85jO9id96XiazOgU5sdPezE9Vv7QvgzMJ3b1RFDW/D
         7xn9z3NjJvWJ/Ow9zuXE0Mx/gwpx+9Q36FQpGuFlvEnV5B9wLjYyfymblOBP+sj2RY1l
         wipP2ZETgLCb4p5t8M5B2l2hgkQ9lJZaDmBTsfo0mhIQTVaDC47mpvf5ifxYhw6YE9cW
         so6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FWbWmLupSF1aasSwvHeKUZ8NUkzaQhzFHcG2dLXCb2Y=;
        fh=fV6DDL4nqvRI+SkP6W7y4XSBOC05Too+yd1nakbbt+k=;
        b=Tb2D/T360UmD1EtOeeng/nkbHvK6gtWVOg0wwa+PCF/E8WCNRYiuUV/lb5QrcPo2ve
         V9qqsu+0JwucA0VWICSJSYK3mMBwP5EzHv3rjG0mfBTJxRILtyjeFUDcWwtEVMXLa7H6
         eQrB2otEOi4mvXexRmG/Tdq3tWKHFxL+m1/6B4Qh+JYrdLUD5sKAjizYdrLHcNyELH46
         5ROe96EqmkeksgF8NM6piCGHeHr+j3OwD91KNHGznPF2tyEToj5uTCWbvl+RcliCMc7/
         dtz0ZoMSQzRVnoJywLZ3vDAUvrVnzxEqUqA2DdR8cJIcgQdS4RbmUTc8PNcoeubpwkmM
         0LfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777557631; x=1778162431; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FWbWmLupSF1aasSwvHeKUZ8NUkzaQhzFHcG2dLXCb2Y=;
        b=Q0tQbm9B1MIVXGz9UCnrF0SQJ95ozItGtVjiGTiS8LAyMInqzXq4sP6hMkajQVrJKT
         BABwlFUN7zcoeBZ8ig2iQsKaSXur2nZqzVvOqC7PsfHHFOs6PXGOvA58yS08/BiQaw72
         QTWtcGgaM5k/L1EZNg+35Uwv4G6VdMRQqU6u4QZPNZ2YxHcxETOmUMdOa/9qZDRuRdz9
         ayR/Johk0h9zNzequLgSDZ0W6NYfs0XxRLf8pcepoy3ZEslmYi3Q0FvwpvNundObdwUv
         BU6q/+Iv04qC28O+Hou04sHmoErIkDKWdYVFFCsklSrGdvuMqkCrD2I2wADF9JEWLRbg
         h0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557631; x=1778162431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWbWmLupSF1aasSwvHeKUZ8NUkzaQhzFHcG2dLXCb2Y=;
        b=Ng4XXHECHAT4UU/Xcx0Dl6gawkHVp13EFq0EoQ7Z0I7HYZp4WqvhmWw5LWHT2Hl+Oc
         7/bFV9D36mf3R8B7nq0hi5re0LCsbKc4WJnkEH3w3trghuxjALJFchZ+BtW6euKrW3YT
         2Wa+0lwxiISyJJRW+WhX8ufsWPio/zeUCng5OFG2jPzIE/wMW6neRrXhzFETKqWqvZmI
         zN0ertORfT0fhnGjINVahc0WCQTaJtaYCNhhTjLl+ANtPdDwGeM0TufdHoHzFB7kQMfr
         SsKBeQywU/6Xo2hcuPsUil2frRCG97Pt4lazr/CeeDchGos1tTAk8Itbc0R8OHGKwklC
         4t6g==
X-Forwarded-Encrypted: i=1; AFNElJ+fxeYOoaxH+Q+9NCflWPrw6GJxpia5+XYqW+dsqQ60F1ZgCz7etbRj8I67ECZS8p6xFTxtA7C+pR/7KMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+flQpjAWvWUxF/8mM8yRXpqqfr0IrJLG3MY4qb+eeUdYhbjo
	CURqD+zDV9f9t5xGz4PMQ1UvAG4y+YQVJ3onpoYJgJLtiwjio6NDHWKLZDlKBCGbYceopt0OQlM
	SwBUwDFekmkQKS9x+u7OO1buCyHlqThMLBwcM2GiG
X-Gm-Gg: AeBDiesGrkGUL64XViA+wquVqTrl9Xvy0i9Q66fqVGs5snrfimxe6MsE9WzqaU3XP6G
	7t1/ceRQNO0gZeHLt9ho716//a9DzS4ikPo6RhtJMKIw2qoprVxJgeb6xysX+0jQo1HeoaL7ahA
	uFQ4ohbzeyV4mUbNr91hHxmY0wYBRcCIfnEsuxoQkMZnlyNn9Jes5oyzsOfRHw2GUtUgx5bMEzD
	uka2Mx6MjlAQymqsxmqxBAHGdaT87+lZ4DcTNC99k2pHpX3lvFyHz/xrc7fJyqtUn8yrD3q1hd8
	XCbbevAmixENydb5BfwbdwwttFOsJ9wj5b7tSTPa7AZbty41UX6pg1sL2a4=
X-Received: by 2002:a05:7022:92c:b0:129:1d25:f1da with SMTP id
 a92af1059eb24-12dec602250mr1294888c88.3.1777557630763; Thu, 30 Apr 2026
 07:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424132427.2703076-1-elver@google.com> <20260424132427.2703076-2-elver@google.com>
 <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org>
In-Reply-To: <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 30 Apr 2026 15:59:52 +0200
X-Gm-Features: AVHnY4L3BCY_keL_qhcVurJjgr2ukKogo3SaEXX5idcPkTjREyzfeKAeC-ucDp0
Message-ID: <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] slab: fix kernel-docs for mm-api
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: F338C4A3C85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12950-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,lwn.net,kernel.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Thu, 30 Apr 2026 at 15:40, Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
>
> On 4/24/26 15:24, Marco Elver wrote:
> > The mm-api kernel-doc comments have been broken for a while, as many
> > documented symbols shifted from being direct function definitions to
> > macros wrapping _noprof implementations during the introduction of
> > allocation tagging (starting with commit 7bd230a26648 "mm/slab: enable
> > slab allocation tagging for kmalloc and friends").
> >
> > When the kernel-doc block remains above the internal implementation
> > function but uses the public API name, the documentation generator fails
> > to associate the documented symbol and generates warnings and fails to
> > emit the documentation.
> >
> > Fix this by:
> >
> > 1. Moving the kernel-doc comment blocks from slub.c to slab.h, placing
> >    them directly above the user-facing macros.
> >
> > 2. Converting the variadic macros for the documented APIs to use
> >    explicit arguments.
> >
> > No functional change intended.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
>
> +Cc Jon
>
> I thought it was supposed to work because the kernel-doc scripts were at the
> time taught by commit 51a7bf0238c2 ("scripts/kernel-doc: drop "_noprof" on
> function prototypes") to handle _noprof. In the current form git grep finds:
>
> tools/lib/python/kdoc/kdoc_parser.py:        suffixes = [ '_noprof' ]
> tools/lib/python/kdoc/xforms_lists.py:        (KernRe("_noprof"), ""),
>
> Doesn't it work for you then?

Ah, I see. So it doesn't work anymore because we add the '_' prefix, too.

I guess the question is if we want to proliferate more kdoc parser
special cases, or just move the docs to the macros. The downside of
macros is that they lose the types in the displayed function
signature.

Preferences?

