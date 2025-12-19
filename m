Return-Path: <linux-kbuild+bounces-10211-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E65CCD09AA
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 16:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5705B3062C3B
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 15:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D4D33C195;
	Fri, 19 Dec 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hHH5+bj9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0064623EA82
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159144; cv=none; b=ai6apN1jx31KVLUOOwPnB9jEgQYycYRxqiNxZGRgN3Efzsk887n/b7ph45kaLod+O8+D99RB0dixwmq5jr4RUkJRLFnnUAd1raCUxRNG4/AWVYh8gnjZu2CTGzG6bMiRprreDmEVkwKnwUtM+kcvB0rhOaAs4XoaxAHgAYM1hJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159144; c=relaxed/simple;
	bh=eXGkgk2np9CnqeU2wkxlYEOA75Yi53MyCAIm51ULRmQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eJTfKeADPipeC18euPhQt/p2xqoufKFG3KG+fw5y+QSwWNZECx5BF2NtTA5gNK3uLyaPNhhtcEpt7fFB7eH5oh1krBjc/wFlfrEzHRbSLerM6+TW9ZaTb7Wn8TFF7XrqqYmZV9JMdvfa4jU+5hJO/ygyGefJvxUeB1ZtpuHY0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hHH5+bj9; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47910af0c8bso15818445e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159140; x=1766763940; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cp89rZHQypoAlOCNHCyWU3ytuEytNXkoLr0IcNjmOds=;
        b=hHH5+bj9mD08sRTK9V51sFdSChVwD0Dlk8kExvuhbyuSQt2nMrVO7SUz5wjXnBd0NC
         Ey16ADfJ8JTu+iWTLtsVwR+6EoNLmMEAcfgWqqNhRhnrTI/I89ttGn7TQeMWzweXNq7/
         ajG1b4CAkZS6juXQxlYeM6TNHvxNHt9deQGn1YCJ/uO0rDtLwW3lT/azW7CLy6oK+z37
         hKsrWG6WCBOvYtii+kHj3gwtjLeqIJR5HOBH8Cop9z2VuPZu0ICfRkW/tzOmD/5lYFO2
         qloM8CRIr7p13snihP4GyqiAfFA9367HA2H9AhAMPjZfAYZJ6erIPiOfKBAdSIwcibLf
         nXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159140; x=1766763940;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cp89rZHQypoAlOCNHCyWU3ytuEytNXkoLr0IcNjmOds=;
        b=c6gXOCpcDAdBVIk9W96HsXVx2Ebz1eNw7MjKHgpr2Bzm3BSAgRnRf9o+rHvws3lJWz
         R+k/rSx35GPAgBw9mlMRDVlpjTQjv2vSEzxUb4ADGAz1+JDSzrlldRvQeVoEQ0UFK6Y6
         Ib9P4+V2FWpUFzYUorhIk9QwsN7xWephPayQdi+ZIptho4wMNNXrj+0RMhmRMISNPrar
         rXiVV6WlpMSoi4+GhW4z+hWyu2Ggw+L/ud8lJrGc0AvrJ8XwuIw1Nsf9eiLHgigZ8wDN
         k73JYE1GsGx4/QSwKO9lxsybmifbXxa6K7IoZRby4V6I3mybRMhkr5akqpV5D61h4bMs
         5Mzg==
X-Forwarded-Encrypted: i=1; AJvYcCXbYPgB0e6ucJjDBv9oaci4dnxdBaijMxK6emJ84YpmpydMW3Uj3YrzIR2nXcLN2jpaNErHe8+slF9v7YY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe6mHOTZi9URxbLJpbnJ3BvTbrYtH0EEySelplxYbl/44mBvJI
	b2y8/MDCNFmBwO1AkF+6gt9B+uC42kBb97SzMxtpt+KgUeSnlML1t3Nw8FZoWwNm+07u+Z2dkm7
	X9Q==
X-Google-Smtp-Source: AGHT+IEo4aI5AYzB6mIv/Q1TYzZNn72eZTN+KjN0BRtkpQb5xaIDLH0+DGUI6xvUKW6b1Bpd8Cf9msZmEQ==
X-Received: from wmpy33.prod.google.com ([2002:a05:600c:3421:b0:477:103e:8e30])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a010:b0:47a:80f8:82ab
 with SMTP id 5b1f17b1804b1-47d1957f71dmr30483175e9.24.1766159140325; Fri, 19
 Dec 2025 07:45:40 -0800 (PST)
Date: Fri, 19 Dec 2025 16:39:54 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-6-elver@google.com>
Subject: [PATCH v5 05/36] checkpatch: Warn about context_unsafe() without comment
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Warn about applications of context_unsafe() without a comment, to
encourage documenting the reasoning behind why it was deemed safe.

Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Rename capability -> context analysis.
* Avoid nested if.
---
 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c0250244cf7a..c4fd8bdff528 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6733,6 +6733,13 @@ sub process {
 			}
 		}
 
+# check for context_unsafe without a comment.
+		if ($line =~ /\bcontext_unsafe\b/ &&
+		    !ctx_has_comment($first_line, $linenr)) {
+			WARN("CONTEXT_UNSAFE",
+			     "context_unsafe without comment\n" . $herecurr);
+		}
+
 # check of hardware specific defines
 		if ($line =~ m@^.\s*\#\s*if.*\b(__i386__|__powerpc64__|__sun__|__s390x__)\b@ && $realfile !~ m@include/asm-@) {
 			CHK("ARCH_DEFINES",
-- 
2.52.0.322.g1dd061c0dc-goog


