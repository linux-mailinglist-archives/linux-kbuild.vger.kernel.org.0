Return-Path: <linux-kbuild+bounces-5143-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96C09F2D7E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 10:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701B8166552
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 09:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47434202C5B;
	Mon, 16 Dec 2024 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M4KnY6+u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1815202C55
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342950; cv=none; b=epg9Dtk4N3X8iOYM5xYbpxRnoTuvYIH/0aQNliCsleljAm4LJ1U6mA9T+eLku928ddKpEqS5j6yvXSAR9/9Zz7DXZzO4QNYAxG7OyhjG2hP0mcdHl6urCh+WLB+j22nG09Wf/j72Hks2IwjITjGTy0uPJDWMQbovP/24rtpU7hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342950; c=relaxed/simple;
	bh=kwbicLQAaZ25kUVEuKSW5PKae5KTmR13E/wKvhnjD1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=juBZRZw+o5OBhZjZ96LgjewEisPxxshcC/c0QdT+umY9/HN6zF4fjSlljgZMh/YRW3gplSfaH2ierLKIu32yNsE2y/xaC/ggizksZsGMa7lb9IsVv3DNd/Llj/gGLPEuIjBsRo7PltX8MmxPmpqRyH60IvZZrTqPmlSn1mKozLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M4KnY6+u; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467abce2ef9so376911cf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 01:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734342947; x=1734947747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kwbicLQAaZ25kUVEuKSW5PKae5KTmR13E/wKvhnjD1c=;
        b=M4KnY6+uj4muv/EYfc7oo6TcpdIVp6pQ29M9E7rQv4FVVVHP15F024EZ69ytkkSTAf
         ItMHjMUHV7XvCAuTAkfkUKWA+6hVg03ieaO/G+94W6j6QI5W18iC539qXWIWMCyp3zPx
         jdAvBGWBgwl3FF+JSKBV6M2OxV8nLqGFLcKNgIJjUMFvez4qWbYewecouz3EAkkeLDw6
         u97mnM45j5Raa3UWB4WJha1yzOOMtwGHsOzUgi0Y3d9SwSp6Pb2JE1G66+XSKz3ngNFD
         Kzl+y2GoANtFqt8IMejbJfhyRljMUtoQIqTSi9jtwtWNj3/t1H4Du/ghLWtw+Id8iRhC
         59+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734342947; x=1734947747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwbicLQAaZ25kUVEuKSW5PKae5KTmR13E/wKvhnjD1c=;
        b=iHXCY2y6AlFWJDLGxnIfBf8ywp+w4V77UpfRXAmZmXVibXiI42X9f4/h4N6v4dM/Ni
         xIg4PYaOdxie8Thjlf7bmL18CnTlWtlELxPNzCvA8pG1PUJHyxMaFJWMcxmGgDDvwDTQ
         /Fsc7b4BtzdpQAUnpCyW7DbgEdbVz4+j+KUHUAX8ptXo5sgzx/wMpOthCzsmzmEdVIGG
         qB4iJiP5cxXojgnkXTtLyUGaZ0UzfkQyvvl7Q3CmyHxb2ahWXUsXrGWEsDMgRTv2yMio
         oGIvx5Zfb0ujz3oibLg3dvk7jvL6LjbNWAoFWB8tvHqtM7OjrSABY+Aq7JBzOE4P/GK2
         FC7A==
X-Forwarded-Encrypted: i=1; AJvYcCX820+SVZAaiNwJ75BbBLXjUPvq1OcG2zyziStiz/sjjHQvzEQvdjPIkmtfTxetQTGO2IIHp9NLoBuaGEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww2iRBbW5IFI4yHCHBBH5nhmOL+MZzXUjYb/pDshV4D7ozTsS4
	POx3IM7kr04D8vpUJ3ena65o/SXqzipR0is2uyyiqgdVoo/an5e3ZkXycNrjkRtjfNCgAGUzZoI
	hwzB259heUwlY43yvx6tSgj4Dp0Bwu8sThPuKzVn7f4cEKPStV1ly
X-Gm-Gg: ASbGncv/kbmky5a3U3N70Shd6lCQuvSwPjUrs8bBbS0YIP7GPnDM5rG/AhJX47pA1SQ
	WXE4TFZIAvmF4kDkJ9EGSXh3sR3DN1XI76tah8z8OPWxCTQTPXF8NnhZubnfO8DJjLWAA
X-Google-Smtp-Source: AGHT+IFhMvIXdbRZOcnTLEcbNjsVH96/VrL1zhECcx0p0tNYZx6zpfl70xXcIg6493jrc/wn5pPrjVOSlsL1jiDf7bY=
X-Received: by 2002:ac8:574e:0:b0:461:3311:8986 with SMTP id
 d75a77b69052e-467b30bdbdamr5040591cf.18.1734342947368; Mon, 16 Dec 2024
 01:55:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-objtool-strict-v1-0-fd388f9d971f@google.com>
 <20241213-objtool-strict-v1-1-fd388f9d971f@google.com> <20241214003605.gwlfukj3tdelx4bq@jpoimboe>
In-Reply-To: <20241214003605.gwlfukj3tdelx4bq@jpoimboe>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 16 Dec 2024 10:55:34 +0100
X-Gm-Features: AbW1kvYR2wFvoUWGEr5jX5uwNIWb-PWBSg9rh6xevYSQ8gDOUgZ1biEtXZ_I3t0
Message-ID: <CA+i-1C3WmjY6rrg9rTpwctMdYKB+u1=dNHEfZz6zPU7RyHdsKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] objtool: Add --fail-on-warn
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Dec 2024 at 01:36, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> How about "--Werror" to mirror the compiler -Werror option.

Sure, --Werror sounds good to me.

