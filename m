Return-Path: <linux-kbuild+bounces-9270-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B0C027E3
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 18:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 051101AA21A6
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 16:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CF5314D1E;
	Thu, 23 Oct 2025 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hEDceyO/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B630CD85
	for <linux-kbuild@vger.kernel.org>; Thu, 23 Oct 2025 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761238114; cv=none; b=GCriIPgk8Slrf3uGIcN+DNiow4RCj2Uty08KHlgRzKEQcmAAxErMEraeXxxUOHBytKnPLxlquK3gy+w6c3xaKR6ZoLB1FS+wdfd/22nBNAtRuxuw6al04OZmtV726VSBdafdQZdAk/DfhjAENAptIV5/WbRbxm0MZUJx2OyCqzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761238114; c=relaxed/simple;
	bh=FYNuNzJQUfALIIo2OS88M9jsE9SMndEp7YsFIxmAfnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NW+wepBNmBvBiHWbg7DU/mksGdYDeMRrFrjm5D1uj3UDQnWASwY+CnNlTuZmfIw5mI/08I3NLT5XuDrC1ntXIdYE67KjqXOurPqqAIOCPT/oe9RHQVoRbNwkrPs0hGp99Rfaz9BUjEenMBFFM/EkJtJ6FiWNh4q51ShnxuVfnmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hEDceyO/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b5a8184144dso172972866b.1
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Oct 2025 09:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761238111; x=1761842911; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1hwlgH/Jwm1lgsle2AVf57DwDHh4FIJzLxRgZAsCOEE=;
        b=hEDceyO/wybL7E3lnNPr8mA9Lfjz0sfyP0mYgncLuA2vRlaH99DjR5NTgOltqQrImj
         EPwVZthxBn2NSi9VjSL5x/QI5Me7wOvSBNWlHHFvr187Ec4B+Zx58IzRZgFjvKkg135h
         23sTZSo2aTBYfYmxXKNHlmswfLJAHGVIH+46U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761238111; x=1761842911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hwlgH/Jwm1lgsle2AVf57DwDHh4FIJzLxRgZAsCOEE=;
        b=fIg2NuM3pvgIOmRvrtknK9+ucfLKUPSOlmKoLgjQ/KpzDWxg83Ifj/uxWBntjiVTHc
         roT85gF47fUwFtQbFWakl9PFURjeCbOobad7YBeBeQ+Zq3kxrZmhXrbqK0HLZDGXDFnj
         nVYi/YQ/KMbgRo2N+E/p9BFcf35Saoz6oEHAq5BFuCUpyy4W5S1ubjsJfQ0QuGwxHRkS
         Sz7D668ur9R4qZVgw5ZDWkI0hM8cs7gCBciSWpPPOfeZud8EyCFpn7gMg+ovNgjtDOkc
         sIoh/ux5jkH5+F7hy4JleLy1bVEVy7qn5DQPijrQEyFGXb2Mgz4sHSu77X//5AaRHeTC
         /4lA==
X-Forwarded-Encrypted: i=1; AJvYcCX6v3zAS3Q76KgjDSQolXSOHXVOr24vIh94Grc/Csy7izgN3oOzYiLGZoqRtABiP4AnIOSauy8RIwNyG8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Nb5t42iiym6kEQ3JGvxzGmXTH7aZT2K0f2YZnttPi0DQPA8l
	9KDqgDn083Y8WYWYwhF13PYFgKYAOJBw6uylSlSJU0Tywrr4E9YkkFd6gDRbs7GMsyvy3FqkcUb
	A66LbJxgReA==
X-Gm-Gg: ASbGnctJL0CAY4v3awn1sOWy6jpwChyk28BSKz5ehbuHGZDr+GQgYWD1LQAQj8znVij
	6OyXfmRuJDqCXVOxQlOiklCdvDFwlYz9GM5geXB1niOfrmEOhTuyVckbE/in2QkQOaYVoaN35ZQ
	Ej/SnPih0fMvPXOUQT5kixEev4peeNK6shsspGkZU3y+sLbMq9SyD5p1xlLLFnhJGToXygdOs0t
	h0yB4ZOGXzFbvR4qgA1Gtj085E7olIh2M+X+eqnSOZE+5yhqPbBqm2JX2Tabhxye4gS6SJ71Vd6
	jQjfumAg998JpcQEhS2v94kSlqgzoAcUle7cnDsr8EWzLyAVaOw0irIqyV9e3XRwrXVtsWzlBAZ
	5H+wAr54jZHnPVNWEXqaSnbHhfsEv81J1KSnHrTehlH0V8gDgWNLT9QbPNRaMN+AgwZp9EYpSbl
	1Dq5fo61quTeYDJQbtR6NmWNM3x4mlT7osTpH2q4OXD4oWYLGLbO6UUY5j7zN5
X-Google-Smtp-Source: AGHT+IFKzOgwW/TWP23x9Bqj1WEGSoA2vdRHExniUKC+oNX6p1f2o+NvT+szq2C2tOh91zH1bkSPtA==
X-Received: by 2002:a17:907:948f:b0:b2c:dc13:89e3 with SMTP id a640c23a62f3a-b64768d530dmr1838239666b.59.1761238110897;
        Thu, 23 Oct 2025 09:48:30 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d50dd0dd4sm255379166b.0.2025.10.23.09.48.29
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 09:48:30 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so219767866b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Oct 2025 09:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEIxukx9uSSbOboWsxuraPnu8nTK5zIAhWYiW7ZJn0Fv/N+TwZSDmlmEx8MWS+hPaABYvtRslch2mUqio=@vger.kernel.org
X-Received: by 2002:a17:907:2d06:b0:b40:cfe9:ed2c with SMTP id
 a640c23a62f3a-b64769cd245mr2845599166b.64.1761238109574; Thu, 23 Oct 2025
 09:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023082142.2104456-1-linux@rasmusvillemoes.dk> <20251023164408.GB2090923@ax162>
In-Reply-To: <20251023164408.GB2090923@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Oct 2025 06:48:13 -1000
X-Gmail-Original-Message-ID: <CAHk-=wg6mxof1=egFUDTNEj3__tCWLTbKjYLzxipVCn6ndXr+g@mail.gmail.com>
X-Gm-Features: AWmQ_bnVmNdsK74q7n823FaHLDwrv3TDkm2pnoZHMOtAws8D_7gQ2A_MzQsBWg8
Message-ID: <CAHk-=wg6mxof1=egFUDTNEj3__tCWLTbKjYLzxipVCn6ndXr+g@mail.gmail.com>
Subject: Re: [PATCH] fs/pipe: stop duplicating union pipe_index declaration
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	David Sterba <dsterba@suse.com>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 06:44, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Yeah, this would also be a good conversion example so we could include
> it in kbuild-next with the appropriate Acks. We probably do not want to
> take too many other conversions in the initial pull. If people really
> want to use this in other places for 6.19, we should probably do a
> shared branch for these changes that maintainers could pull into their
> own trees.

Yes. This is a good example of what the use case is and why we're
doing this extension. So Ack both on including it as such, and on the
whole "let's not go overboard with other conversions" thing.

             Linus

