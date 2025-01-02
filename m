Return-Path: <linux-kbuild+bounces-5291-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 765EF9FFF6E
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 20:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C99F17A1714
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 19:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0AD1B6CEF;
	Thu,  2 Jan 2025 19:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DIODc780"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D209B1A9B53
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Jan 2025 19:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735846235; cv=none; b=Xxte1iWRemKb5nmU4QEr+XUrf3vwwnddj+uRsPQQ2+mxG6Dl5QkGzUCqcRc/AFWwZUfPkliPzuiJnFcMBeH0gbrOxjuoiRYOFzjF39mpECdbd7urjHBbOfuhOKDpAveQVssM2EwhxDHWOEU90QUQ5c57lwQqdWT4fQqL3od4vnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735846235; c=relaxed/simple;
	bh=uovgF/lPK6er1So/gVnn/fh0FzkKPM0lYUu800eNqng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3pCD0n6jyvaQySRDOpHSQ9kDBbCEAy/vga8fpVRmng/tnc/A/r1XkL53ktS2YYGhz1eoghub+/f+XCeD1PnYWM+9L501WwhWvZZJNy92UhvmcvpvEDIEWQDXMTC6XtqhHE8MaZmJzvq2FtGbHsTXdOVNFbBi3cppnc3M2dibds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DIODc780; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so392634a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Jan 2025 11:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735846231; x=1736451031; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IkRRoUTAoPCUhgTT5UTFQy+df5m2Y91ZttoTEhYnYYg=;
        b=DIODc780qXa07EWzN3MW1w+R4sDFqma+yd+LD5LRJUV1DOAZrIeBt1BVgwmJrz9h59
         1EJETUiH5TI5IY+jzZKZJ6+KOj+bfhTWU9+ljbM/Cul2teMOIsDwfTStvPcLbhkUnSkg
         xtPT3jcLNW/XwjmFxdWKYnxQpkpiwHlZtzU7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735846231; x=1736451031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkRRoUTAoPCUhgTT5UTFQy+df5m2Y91ZttoTEhYnYYg=;
        b=lmkfa0MVRyDBKJtXVi1E8Wczk6FTNqu0RmH0FnMN8BAEuuYmyD4BxjOcEyXYe7J/4F
         gbV+0HkvjcM6SQ6ZDp2NF+m2oOFZApkH5OqWNgKNBIkb/ka2ftQJRp5LHNPVdd047luS
         gDJvSs+/407wXTNE72/x+T5lpTCosbJcxcvm0FlZ4sOWCUkScj7RBwOYHqHaEPGIZAvb
         G4/N7rZnspLeHUm3BXWebrztuoVBnX6qmh0qJEo3ois2HvMVKiGxqMCKjZfxkWjkXVmJ
         or9CqU7mmvD+w6Uowme/PBL+WXo4+PVy0WjiIskgufKM4CK4O0EdKdkzKCSNaDyiDy8C
         M4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXNAG9rfI6B1fH6ZNLIyrsf/vVo8osapwLtt+VRKsdO7LV6xrrUBMv5gLU3nO7ezKQIULxzoqJDmZ3o1GM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx77geukTKVqvsFhy6Qvgklaj5gJam1a1VfG1Hh7wQq++nq0Rit
	1U1gxBb+ITX/S62fNiBGY9KioqSzkV+X5zy/6hWQLYbgz2vf6Vjl+CLCCVzSppkuJ13Hl/p0pQI
	35hw=
X-Gm-Gg: ASbGncvRQ+HzTI6QhsMeGiFiZfeMMwfF+4pEALGiyugwSqpWQUlhW60zW//rb0MRP5R
	565cBhwZ3QW/c3+SNAvYtudk0Th8gwjs7muTzrMMRIC14ewJU1WxUNEETPVjqvte09amN60jk9T
	LhMMnxGGvOuBqTiWtFPOPhwI0o+yfzUBYLG3pY/keagziadqsVmC8sC4/TJ114UV8KTi6RDr27A
	+YFY00z+sMZK+n7UThMXwmrCcnjW0nGA3959RFvMb4gV5mHJkAGqUiqlzaCUiEr4/6R0+rXPOJ8
	Pz7dQdoN604JA2acouknt3jOgzLFkrY=
X-Google-Smtp-Source: AGHT+IEzMfaqn3vZIltjLi8+p4AivDtmG6ENsf6QBDeXlgxfj8T7ibcejOPqly3zY8LusCX7gQ3nsQ==
X-Received: by 2002:a05:6402:3507:b0:5d1:fb79:c1b2 with SMTP id 4fb4d7f45d1cf-5d81dd7f7f8mr42517586a12.11.1735846230913;
        Thu, 02 Jan 2025 11:30:30 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701a4cesm18462880a12.72.2025.01.02.11.30.29
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 11:30:29 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa6a92f863cso1972688766b.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Jan 2025 11:30:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5rgd1NhK03GpHoSBUApo02q5VPT+qVvyEO6ClV60Ea4r0GB1aoIhZ0mi92ThAbq5zM/JklpvZJJU8Qas=@vger.kernel.org
X-Received: by 2002:a17:906:c14c:b0:aa6:80fa:f692 with SMTP id
 a640c23a62f3a-aac33691020mr4123756466b.49.1735846228960; Thu, 02 Jan 2025
 11:30:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102185845.928488650@goodmis.org>
In-Reply-To: <20250102185845.928488650@goodmis.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 2 Jan 2025 11:30:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjg4ckXG6tQHFAU_mL5vEFedwjGe=uahb31Oju50bYbNA@mail.gmail.com>
Message-ID: <CAHk-=wjg4ckXG6tQHFAU_mL5vEFedwjGe=uahb31Oju50bYbNA@mail.gmail.com>
Subject: Re: [PATCH 00/14] scripts/sorttable: ftrace: Remove place holders for
 weak functions in available_filter_functions
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Zheng Yejian <zhengyejian1@huawei.com>, Martin Kelly <martin.kelly@crowdstrike.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Jan 2025 at 10:59, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Where the file created by "nm -S" is read, recording the address
> and the associated sizes of each function. It then is sorted, and
> before sorting the mcount_loc table, it is scanned to make sure
> all symbols in the mcounc_loc are within the boundaries of the functions
> defined by nm. If they are not, they are zeroed out, as they are most
> likely weak functions (I don't know what else they would be).

Please just do this by sorting non-existent functions at the end,
instead of just zeroing them out.

That makes the mcount_loc table dense in valid entries. We could then
just rewrite the size of the table (or just add a variable containing
the size, if you don't want to change ELF metadata - but you're
already sorting the table, so why not?)

Because:

> Then on boot up, when creating the ftrace tables from the mcount_loc
> table, it will ignore any function that matches the kaslr_offset()
> value.

Why even do that? Why not just make the mcount_loc table be proper in
the first place.

             Linus

