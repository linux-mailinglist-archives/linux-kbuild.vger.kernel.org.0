Return-Path: <linux-kbuild+bounces-2381-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE16927CEB
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 20:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B0D5282198
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 18:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30612132111;
	Thu,  4 Jul 2024 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPtMHhR6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860418287F
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jul 2024 18:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720117012; cv=none; b=MEJmsgrnKvGdzuaWkMQgqjpd/7LxMXAndGIUeK1PAfQt7alINoahqB4x83aRwN1tFqWhzu8XRLkCgfgfUXG5ScUU6z7fIo5smnHxE4h3FaLdCmj1kSmIgwr900alrgUFsaTvSIroA6X8IV5/OO7dW3Wf57AYRX7hx/pODR6oPXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720117012; c=relaxed/simple;
	bh=K1T6ZawzBlBnfgQGA6b/NDi26XjCQM/zwcbsfUJHPo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYS5iDDZrWl+LRmEe7YpZordR0q/n1JTSc1h3lfXHOeAO4aj+4BHGWWLxYVhIejcZAgY1A+R+Fnc7SKrCMSN/l/cAz6rwoucx7EWRVB72E6IFctXIoXUc3IKUA2YmMnP0ZZgLKvInXpBL9BOh9Huk9qXrA4+bzd27MeJ2sDHa5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPtMHhR6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720117009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m/tL4EMiXTDJKBrPbp1fE5+l3HieNY6sEKsGtIXGNJU=;
	b=dPtMHhR62qybzWs7Ag1Lm0zI1S4/BzmH5SqNDIKCgTHx/gR2v6JqpvCvor+LFG7RxpP5UH
	0O83vraUR8ILq+BNgh0Dw5tzrTejBmxcTkzDi87sStghH7xUezmUjAMQQTqVHwcaOcn8SP
	Knnhws5KsgmLZ7Q+c6q/k1N4eQQRGHQ=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-kLNOfsHOOFCEZZ48UWFQAA-1; Thu, 04 Jul 2024 14:16:45 -0400
X-MC-Unique: kLNOfsHOOFCEZZ48UWFQAA-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-48feb0d1abdso384542137.0
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jul 2024 11:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720117005; x=1720721805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/tL4EMiXTDJKBrPbp1fE5+l3HieNY6sEKsGtIXGNJU=;
        b=OBxywUToUxIaeWw5MWTCWVOu9GPgVeC6bzGg7jhHKOd921jtJeW/8iOdHOGMoSzKbH
         hApcdjlqTWbqUGAlQ2QJ/dyyVMUy4bwntktiF6EdIIh/5hSaXaFwwREV3V7uhHJtKurD
         qiLXINsaZ2X1fe5NRqV1u0A2C2i4eXzw0wqr91BZXKHhVv8YqTkgfc5jRgDyWZMqqiuD
         kKH4JwOwzroQuIFpM4Ur1mtvJPlrClRuUipL3cnjNSDEn3P3ri1DCXbOfhD/5qfv1OSE
         Td8Sff3FP62Qx5oRSDVyIW+C/6WYIT9ioGsa6rYjRfs/QARAFCkzXijVkI06hgpvi66d
         l8tQ==
X-Gm-Message-State: AOJu0YylYp33Qmv+oJ7Qs7FMWsiD+UAOTHC0r0fjoqmfdjKgBFynNGSV
	QRRa+YGkrHuxKmYFDGMCubVEnCxV0GOdIYXIiMOBSL1szTEjmY1RUvLUsO8AaCfwN3thT+TsTAi
	pIcZinEQQM/dNtm9UFubHmkJ1ErmWDHTuzxVraqN0tEBjEfGnocgZeN3fizcvBZuqJ1iH4A==
X-Received: by 2002:a67:ff14:0:b0:48f:90f8:efda with SMTP id ada2fe7eead31-48fee91a190mr2269674137.32.1720117005057;
        Thu, 04 Jul 2024 11:16:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwugEbb61NqUslFCARGx4L7HhqAn7ddwElVnvoUUZKyi49wHMTutsymkPb2xLcooJsvWfxgQ==
X-Received: by 2002:a67:ff14:0:b0:48f:90f8:efda with SMTP id ada2fe7eead31-48fee91a190mr2269653137.32.1720117004755;
        Thu, 04 Jul 2024 11:16:44 -0700 (PDT)
Received: from optiplex-fbsd (c-174-169-122-120.hsd1.nh.comcast.net. [174.169.122.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-446514cdd81sm61539511cf.97.2024.07.04.11.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:16:44 -0700 (PDT)
Date: Thu, 4 Jul 2024 14:16:41 -0400
From: Rafael Aquini <aquini@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 2/2] kbuild: rpm-pkg: introduce a simple changelog section
 for kernel.spec
Message-ID: <ZobnCTZl0qWL93YY@optiplex-fbsd>
References: <CAK7LNATxSePzOrHaQvS1MQo4mpAwdfwrDu3iuUsYZ+RL=LiirA@mail.gmail.com>
 <20240611211123.959459-3-aquini@redhat.com>
 <CAK7LNAQba5CDetpwevSoaOLJ21s1tO9ZHh=7gJpPCNK0AnHfJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQba5CDetpwevSoaOLJ21s1tO9ZHh=7gJpPCNK0AnHfJw@mail.gmail.com>

On Fri, Jul 05, 2024 at 12:52:41AM +0900, Masahiro Yamada wrote:
[...]
> Using 'git config' is OK, but git is optional for 'make binrpm-pkg'.
>
> So, you need to add fallback defaults in case git is not available.
> (this code is available in scripts/package/mkdebian)
>
Alright, that's a fair point. I was originally under the impression 
that check-git would always run on Makefile.package target calls, 
but I see where/why I was mistaken, now. 
I'll get it done in scripts/package/mkspec, as suggested. 

Thank you!
-- Rafael


