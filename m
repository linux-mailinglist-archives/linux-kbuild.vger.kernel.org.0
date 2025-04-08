Return-Path: <linux-kbuild+bounces-6522-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA35A81601
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 21:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED1DA882D1D
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 19:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581281F8921;
	Tue,  8 Apr 2025 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cFvHTU/p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40FF2C9A
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Apr 2025 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141716; cv=none; b=WNivE7g2shjNFb+lLvGRdTGxYsaJAnuRTLmWm2bFnjiTbZF8795ANj5u/swN7axnwimj6Yo/cXs5iOf8IHbqc7E1kVS2MLSioTAqec8S7lgBPXMPQKuOzfyjwBbHxJxrAU5BnuZC1ZERrg/VG08meqyN3gvHpl2YKCsnGY0JB9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141716; c=relaxed/simple;
	bh=JNMC1smP0znMZTGCRhKtNQBanQ+6veq93e3qrxxTCrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSBH1qvA01Qvg5xnU0crUribZCaQ8ta/iGma8WwkMrpSHPOlB7j/iLtt3jmpqZ6gSxht5dw2Nqpoxje/YuztUagwRtjh3osISjsMT3cLLV7mAbCZ1gPOZRGI+xWhBvS30Kz6hJuVgkhTQh8wYKQahzhtv133TzWq70VwTNn8r+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cFvHTU/p; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso54054a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Apr 2025 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744141712; x=1744746512; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zL/uwXeWfg7A6QPOJUAVWLRzIe3+HicAR6S1WGa4/4A=;
        b=cFvHTU/pgQaJUrd9PO1HZjHcsgyAOjNsECiv7F/pIaRb9Om8uz/6tDlXhism9SYv6T
         hUtpsqsOsxRogWdu5nCLWZKKkeOknqL3b3/uAzFtUjRuAjtVMCFTGyvxFXSHu8o/9C+W
         +Gv50LqX+D5GfZJODwbUTrNxgTf9ITycSyFGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141712; x=1744746512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zL/uwXeWfg7A6QPOJUAVWLRzIe3+HicAR6S1WGa4/4A=;
        b=cYbcLT4DaAgj1OrauKGAZ0Ptci+7V4aW0qQlN++NQosBnK+gMexRqYuattZF96Yzr5
         faoU4Af7O93v+pFQFSuDmSpzi9L8UWTPoZr0g7hr4BfKcNP4x9k9iz2DGfS2RyMluwDJ
         fQSUPlhirdIrFrKRZO9mJCo8z5ihO/+w1zpmXLEy0TTVnvt0qpEnWm3VFpGARDDqwtwO
         26vWSubYRNQxTLMgZOxaICkuuLuBufWSZPzka7xl3KhDyEdeOdueIP3SyCYYdf18UtPN
         6JgApZ2BzgleKLE/lPlkNaJzEyRE6OZ+IUVWBfV3IqRtGq+cD3QEL/E7CzfKDmpL3FNw
         PLqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPMrXmi2LkgWdcGM5nNqqw6fEwBmxDNchkte8rGzV8QtspsbGF71e2zeuJjgdOXCXNgzAT7+cmrPLBoSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWi33xXvu4WGDHPcbJ7b9D1YeLxfHNQTuLDaReocOezI38Mby3
	AA5f2up7h5jvg45UHd1UGJikjNplooBGULXhefwuuG7DBUJ4WC4wYeYSgYXtxC/P9aYvR9fTQ/1
	5Gxk=
X-Gm-Gg: ASbGncuRs6UXtS0/3l7GnBoLqxI2VJs3V+z73ugHocinpxsg8daDBCIUMnlpind6zMR
	ahFVb6pLmf+0gwJC+w/mXQyPO3LMub/N5/eTaC0sa3xcAksB07Vr4S6vMamU8pplV4j3FbKh479
	ZGODLlHOeXxma4/1ZMV8gRKJn0Se6qeelOhf4QrqHfCQlhjSHJwxyVkRoykXbpg89Z0N5FIL6k2
	Rpb4MfZjRoPJERW9zOwRkt3EtDJP2Vz5H3xm/22/RbtkEFe31ecqquSnZMVGj6OWYSDPwL0HSBV
	Ce56QMOFwp2Ak+WjlHQor+IIVmx4fiAceMJmyH7qQAv7aOb+5+RSyLfz4PVBvAx9xmOWc4qaTqd
	JCu8ZXuB/FS6YShqV45g=
X-Google-Smtp-Source: AGHT+IE4RBchyDXiVSmP47wqSZMz+7x3PZi1xa3K8mbqjQ2m1u8P0SJ51PONE4GMeJDa9GCbeRfp0w==
X-Received: by 2002:a17:906:c10c:b0:abf:742e:1fde with SMTP id a640c23a62f3a-aca9c03bbe3mr25592466b.14.1744141711730;
        Tue, 08 Apr 2025 12:48:31 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9adbbsm979704166b.63.2025.04.08.12.48.30
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:48:30 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac7bd86f637so5889666b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Apr 2025 12:48:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWW6/d5NCCNeyWr0pwXm4itvBrtYNFz78SqJr7ygL7bLz3TCrUz7fMOGRFnCAH3A0/rhPMAOhRger5BwF4=@vger.kernel.org
X-Received: by 2002:a17:906:6a06:b0:ac7:3929:25f9 with SMTP id
 a640c23a62f3a-ac81a87912bmr311971566b.29.1744141709943; Tue, 08 Apr 2025
 12:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com> <871pu3ys4x.fsf@intel.com>
In-Reply-To: <871pu3ys4x.fsf@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 12:48:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXb5ZVd+=b49957gm2Uo58h8EHBX5_mZfX4R_MJFqd0w@mail.gmail.com>
X-Gm-Features: ATxdqUEdLh_PIaVo8IEhaJ-xWVSdvij9xBxWmcQMsdyDiXQo9KjbMpRmjfCGH_0
Message-ID: <CAHk-=wgXb5ZVd+=b49957gm2Uo58h8EHBX5_mZfX4R_MJFqd0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 01:28, Jani Nikula <jani.nikula@intel.com> wrote:
>
> Your goal may be to make everything self-contained, but AFAICS there is
> no agreement on that goal.

Yeah, absolutely not.

I'm not interested in making some general rule that all headers should
be self-contained.

We already have some fairly obvious and clear exceptions to that, in
how some headers are special and get included early on and headers are
*not* supposed to include them themselves (ie things like
compiler-version.h and kconfig.h)

And while those are *really* special and end up being done
automatically by our compiler flags, they are by no means the only
special cases.

Quite a *lot* of our headers have things like

    # error "Please do not include this file directly."

because those headers are literally *designed* to not be
self-sufficient. And that is absolutely not a mistake. These are
headers that are meant to be included in very specific situations by
specific other header files.

So no. The whole "everything is going to be self-contained" is simply
not going to happen. It's not even worth discussing. It's a
no-starter, and limits our header file design much too much.

Honestly, I think the whole "headers have to be self-contained in
general" thing is a mistake. But I think it's fine for people to mark
their "generic" headers for some kind of checking.

I think it's a bad bad idea to make it a rule, though.

              Linus

