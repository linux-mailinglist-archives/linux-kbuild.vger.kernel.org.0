Return-Path: <linux-kbuild+bounces-8894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48147B85475
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69FBF172901
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469B730BBB7;
	Thu, 18 Sep 2025 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XXTV8oTV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20591304BB8
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758205897; cv=none; b=DvtUMfiDJ9TTZ3NlEzdU66vGWRM2eCGQyXlQlQ2rZehElDtyfsnAHCNaK74BzAutMUVAElmAB1zwvmuEI9k540twuXd8n6upINGjFYPTCj/+GTv9Uu+M6+FW0yd1+O77JrMhLXMOu0lbUaDZkLJIpEKGUo06QLhpk5kdYa5Dv5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758205897; c=relaxed/simple;
	bh=myP/sybN2zsJVXA5VSxoEq1YkiH03BHAZFTkykC2GiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvg9NhOojt4L5BRHst8fVnjVxPTcmsvXecDJSYSQH+pV1E7Gu48Q0hcdy3IUJ1h4P31gKXANuUur3GdYSH62cZDmYsDx95a9uF552/d4SdMlAZamW0O5KX+ZXT3xpDj7kEneJexT51t4RliYem0wBjAOY8t5vFjW7fJFRCmMaiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XXTV8oTV; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32ed19ce5a3so750263a91.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758205893; x=1758810693; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x7wpgOqV2jwxbf7nUbBy2XlSiAc50BZhVeubzU1uvBU=;
        b=XXTV8oTVX6+S8cB3egbJOi+r52l5pS2nTdxLCu3XgCnMJElQ4K7ATWx1gTLCprfKUK
         nQgtAKfeTNowQfoDA+TJVUvxACXAU5g7SX5/YuHWRmZd4uYmfwWBNM+X1oPelM98XG13
         XDyNcDd8MYiEllydXIvpI+V4DL/nH6v+LS0ZeRsSRuS1fy0zk5Z58LJJ8tbrCvvqfhyH
         +/geSbKkYMYURYnyK3n7BJ3l6rnJ3C9Ct5wTV9KT7Eid1PubGWPxkh+2qVqQwpSwVuGd
         dPVlvuTmODDqH3aYI72ZNNRPOE64uPlp5llb0m10owIyJ6NTZVte2z7IXU1vhv4o/YBR
         VLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205893; x=1758810693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7wpgOqV2jwxbf7nUbBy2XlSiAc50BZhVeubzU1uvBU=;
        b=LseWWdJW5BEyRADU28svs/FqqxAPGpEzmrp+kxzNzil8dl8ZUotjmS4gy6rb6xybeg
         miUNuIHFB/TaKrciAKzCqbiVUREuFmSFbONdFSq1T2TgOtRnu0cRYUp80uQk425Kj5+Y
         l2YzTKAwtbpbX/l2x7U52vCw9AFAASDaXhxWo6nAAqtlK6FHQHTf9z7Vu42nP8XngGUi
         Zo3Ts6YQTtCp2cOBGdDwb3jvCNyVz+Zf9J2yQyQ0epyjT0OQ5LhSszH0hXYgP0t51fNB
         dhyyZ9X4lzQ0MTYf/Tjwgv0t6Lj+NqzsvFfsh5V1fuMmySuetiU7xhSUV+EJSaLP3B8r
         ndlA==
X-Forwarded-Encrypted: i=1; AJvYcCWYdBegLDYXS9cOp0VaZt38aVE/jtq5nar/voH9dxguaazLfwp2PoQhe87V7Hk+QNLw3tgVyDxfJDIkfK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFPEW6EP2hlH2V5MvszkVux+R5+qd5vUzlYBgQtRsxjP59bt/
	KNmJlSjb7SzEbSpmn+LUypZPC7hGwqX/uxv24/WN+qt3KyaW6+kfIXSKruaMxWad8C+n/xsY4gf
	GarRZ337GW6pCKY1HOwWIOoPmH1Z7rqLwqWJnJMbQ
X-Gm-Gg: ASbGncvC5m6j1XPfHgSJrKe3+W3PWEsgHR6yANVU5kemKeHMKhlYowRX/D4tcN/tEnX
	tu6L/4lXKoIZfb2uVNNYN9k4pG41dpJls8sOolUv9Zw1xWjkImP035bRAW4lfweHHHUBJxfpmoH
	hL/pMC9IpABliroYQZ7f2LHiOBAkFlQiRuTcT4CYotOlSGTenb8zRPxA0kmfiRKr0uXGGRvb6aL
	XhXlFZE5+PcEYkeYW4CZVOujfcHAvVaJeLIR6iVbegy7njZ/ZsLe1p3z4JmrA==
X-Google-Smtp-Source: AGHT+IHYGUcixIR/dwWsgGEgFB1TOwlgrZ0O4FlqafV2iJGSlcEq1KnUzPyMPrhTBrvu1VqtuDJ2xHHxKwyBuVmjxY4=
X-Received: by 2002:a17:90a:e184:b0:32e:b2f8:8dc1 with SMTP id
 98e67ed59e1d1-32ee3ee55c5mr7425841a91.10.1758205892532; Thu, 18 Sep 2025
 07:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <20250918141511.GA30263@lst.de>
In-Reply-To: <20250918141511.GA30263@lst.de>
From: Marco Elver <elver@google.com>
Date: Thu, 18 Sep 2025 16:30:55 +0200
X-Gm-Features: AS18NWD0SUeFqGV9WlY2IdwTn_KEVlrUb6EWkUXQGUd586AZF2O57bI6Ojf1TCc
Message-ID: <CANpmjNN8Vx5p+0xZAjHA4s6HaGaEdMf_u1c1jiOf=ZKqYYz9Nw@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Christoph Hellwig <hch@lst.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 16:15, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Sep 18, 2025 at 03:59:11PM +0200, Marco Elver wrote:
> > A Clang version that supports `-Wthread-safety-pointer` and the new
> > alias-analysis of capability pointers is required (from this version
> > onwards):
> >
> >       https://github.com/llvm/llvm-project/commit/b4c98fcbe1504841203e610c351a3227f36c92a4 [3]
>
> There's no chance to make say x86 pre-built binaries for that available?

Not officially, but I can try to build something to share if you prefer.
Or a script that automatically pulls and builds clang for you - I have
this old script I just updated to the above commit:
https://gist.github.com/melver/fe8a5fd9e43e21fab569ee24fc9c6072
Does that help?

