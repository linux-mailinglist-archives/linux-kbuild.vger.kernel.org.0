Return-Path: <linux-kbuild+bounces-12741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AmcBDK/2GlVhggAu9opvQ
	(envelope-from <linux-kbuild+bounces-12741-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 11:13:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B93D494F
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 11:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79D993042999
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 09:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2AF3BA251;
	Fri, 10 Apr 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="htlGF32J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B94E3B52E2
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812249; cv=pass; b=RerW0oIpyddFQ3KDhY8u+2o8Aqlq16Wx89dVx2GWLQMg80UGKE1f51pHGCgVkgKudm4nP1bb+AjWancE/6YVqjMbbwLSnJ5z/9UgT+YqtXhiU1u9R7UwhyKK/wTIdr7y0lc7fxsVSYx4i1bLpt04FmfQn8F6XA2h9pkqev0/298=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812249; c=relaxed/simple;
	bh=naitCC6swSoBy1VNvSZ66ZypJ+ORfAmYMB1nrf5YPCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWKgE4nTtE/c3Yy9XD5eeuT1QUrIcTY8wrZdygKL+8udaJaCZqLS8gMfAkEJh0wHVdSXKh9WMctWFhS6kIKlDIAWiABFqn4MSwkvBgy+bX39rm/m82B/Dn2Pal2LlYRA4TizYBs9blsO2Rdo3HKB04uL1T12aKa1iOhMErLNXPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=htlGF32J; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1279eced0b9so2625779c88.0
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 02:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775812246; cv=none;
        d=google.com; s=arc-20240605;
        b=Xl/iSNwuvv2BIFqQXAk3wirwJI970q5vztOACAHzN7eK2uuFWYvYFXMxjCwoG+LceQ
         Lbdq160Hpa9+Lgv7Muu0c5b7Ub4u6PMFcA16Jf0QFv0dbrqj5/ENxd5TTKFBPBjcywyf
         s9V92tCq3beAIV2BavRAUSO1NKE0Lc+fiWy/9bMB2lqIMSxSSxwpX2aWvIr8tHltxl8G
         TeTUzB0h474cLmVcTuFRUM3EmTyjaFZhhuZ9dgVvWAyHU+FWV+gugnHyPwmRGZAHoKPp
         +NPV7WKz/KLTB8+N802qjHhA+wdTuk5yM5ymmddbWtHJuGU+IEEnHJyhfA2WFs5ZZRDj
         rPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=naitCC6swSoBy1VNvSZ66ZypJ+ORfAmYMB1nrf5YPCM=;
        fh=g/XLzq0a7pEeeIVarFXHu0DGyrqDMm3F7GCgDmvb4p8=;
        b=EGoy+iMZxTlDGXA7EHg9uAdAH7ftujyVKgo2Ny6SQHZkxSw/MfRISYXM7HEKIJybhu
         FwR4Di20V1fZ3N6swJIuQ5dwbF/3CJr9clUYwysWUBopzvx4Bw9ZCKEn1/4s+lAC4zc4
         aN7eWhh3BqafhKXkR6S3o0k/GJIRf+6XTO5V7G6CTabjM+6ZYuYoC5XSaD4pRce3Jlhz
         Y9zcTqKOMN2R133GecXuWQD+dHdSQFLTnmjuBsqP1io/fmwPnjfBNYVa+4msqLEi0MLd
         7cE4OBRR7/m6On/9SR8Uc8k1OAmUxA4Xym32ZlNzIJtxODxUlkTuMw0gRpg1FuBMcXa5
         Kskw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775812246; x=1776417046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=naitCC6swSoBy1VNvSZ66ZypJ+ORfAmYMB1nrf5YPCM=;
        b=htlGF32JX2zK1Ccmz/uteTE4Kfs8dCDPYOKTBYEwg8ni1oTg5i95fuFmRuTplFxKj6
         caWvaI1hbm3VQx/f4tJNRgl89j8u5cTA9G4f1Lf61J0LNVqONJLM2GhUljpiTWYDCMJ1
         0GrmTbryz7PpDCjQH/3rYomcy/wp9a/+sd6Di4o8V9K8nasCtFxTrwhuLxzM6u/gOPCX
         g0+WjjwH47PHAETgt+jdAeFNmdivVyP/CUOs8pgl6TMmeMNXH9Ob5RFd5ZY89nzuuX2r
         OIbSMueF69s2p17HLSPYnHF19+HZK2mhnyRAAACfRz/PRlJpfnjmFnBl6vBvd3ybd0JG
         DF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775812246; x=1776417046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naitCC6swSoBy1VNvSZ66ZypJ+ORfAmYMB1nrf5YPCM=;
        b=QEz6xkRALQwQlmw3HwItb0hL7XMlkwNis+5a05GDp+G/Zr9LknLm7phXJhFsKQis/g
         jNAbEhgzEJ1I2YUpgvDi/ccyVG6Pgp/94IlPozJsCRyPpTcTLA4OiQszjg0degt8bbyq
         8PAnxpn1z3bajjnnDGTqT6FOxlwStN5yJBZoemXkuE2KifJFhkyjSmqtr/0sDK2AO9J6
         RlZNzerO1vP9jEecelv8t7hJN6N614Q8ihCZEfdDN5vEFle5OD21FNEafJLm8z2CmtQE
         UDJBTfZqOJtrR5SMOSbzkMgWgvLw5Dpgjsthyz1lpluPvIKv9oKJ3W0VPf/G6hbgRwIW
         tZlw==
X-Forwarded-Encrypted: i=1; AJvYcCVl32W8onzPGoMvoG2gMx6mNu9AOlWOdCICfu63dALzPMz8/9gA4xOSC89wlmWR6RTNtIi0u1ampo55dFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLMeY8QHM00OiXkwRaeyr9dLnmxbTFrwqMg9oHCkE9PXMuuqIu
	JpN/RqRpPrPe9eS5EhRvr+Yr0CYvvpYP0cb5jk9NX1s86y0y9AJxviAZUzBDOK69zbaA9UkO8WG
	h126Kpd0OUDwOH/QFuCrnaKoIKOnefwvj+kBZHs+t
X-Gm-Gg: AeBDievoNu7pzEzeL47VQYoG1xbK6QjZVEWWW4SOsZken2WYfJ5t1oH4/1b2r/7jaD2
	LqzlxTKNv1jEvgix0B2TD412KWgCAIs5RWHkevf6V7afatUkwY3VYvUUpDIHg1uvj/4D2LjlTHl
	FDt/BqRmuJ+6/ehRlIdIReZHPrfgESKAGWjhca7rJ59O2X68SrgbzqCx17HB/iU79Jtm5DdnGUD
	QIm5fK6Q7kK7VHOoWKJH/Is/E6+SqhBvBcRkkSXxU+OMvJw61/ppobf4DRWD2XQjg+WO+svA0aF
	m3MuvbCln0ExVvHiTVUXiKLo1MjiYDM119+iWAQpkiZf3gdk
X-Received: by 2002:a05:7022:250d:b0:11b:b3a1:714a with SMTP id
 a92af1059eb24-12c34e8f8a4mr1549057c88.12.1775812245709; Fri, 10 Apr 2026
 02:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <ac9d5O5XehnXRc5A@hyeyoo>
 <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org> <adM2XVZf1DekahlY@hyeyoo>
 <CANpmjNMeaWWuDMAj_n38U9XRqgZQz30ca82Vy10Bg=NoDfZ5ng@mail.gmail.com>
 <adT-gkVmVDDXR1h_@hyeyoo> <CANpmjNO1aNm3mKphDGWasK_NUfVY8q4K9GCjyREZFqrOu9WLcw@mail.gmail.com>
 <adhcKZGytWdaLxJu@hyeyoo>
In-Reply-To: <adhcKZGytWdaLxJu@hyeyoo>
From: Marco Elver <elver@google.com>
Date: Fri, 10 Apr 2026 11:10:07 +0200
X-Gm-Features: AQROBzC2BBHkcPy4ngHl5oxQazFqhMF2xdQ6OJLOxqq2BaVLmQUNSpLtUA2DJOM
Message-ID: <CANpmjNODn64zxhs8eQM5t_y6GUCbvBK+feAAM6GVDX3-Z8aTGg@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
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
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, 
	Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>
Content-Type: text/plain; charset="UTF-8"
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
	TAGGED_FROM(0.00)[bounces-12741-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huaweicloud.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B99B93D494F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 at 04:10, Harry Yoo (Oracle) <harry@kernel.org> wrote:
[...]
> > Which is sad, because that means we need the macro workaround.
> >
> > Do you want to be credited with Co-authored-by
>
> I'd appreciate that. (I guess you meant Co-developed-by)

Thanks (and yes).

> > - in which case I need your Signed-off-by.
>
> Signed-off-by: Harry Yoo (Oracle) <harry@kernel.org>
>
> > > Not sure if it's safe to do that for exported functions though (since
> > > modules can be built w/ a different compiler).
> >
> > Kernel modules built with a different config (implicit if different
> > compiler) are not supported, and never have been. If it works, it's
> > just luck (I know people do this, but it's just a disaster waiting to
> > happen).
>
> And if GCC folks somehow fix this at some point, even kernel modules
> built with a different version of GCC might not be supported?

Yes, and different compiler version also implies different compiler
(so even GCC A.B != GCC X.Y), because newer compiler versions may
activate different codegen options (some of which we auto-enable if
available).

