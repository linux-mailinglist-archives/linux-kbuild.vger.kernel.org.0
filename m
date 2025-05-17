Return-Path: <linux-kbuild+bounces-7140-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB76ABAACB
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 17:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7CC57A9A7D
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0950A205ABB;
	Sat, 17 May 2025 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="K4490URf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9481FFC54
	for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747494187; cv=none; b=NmUM+ZEuvpDutnEJwX7/jlW/e+CfTqJA641AxC1ez/PkdnoyJU9dVApNkidAVg1s2flioR/1gqiOhD5L5SoIcvBtAjXzfKAtnn6i4ezCvTTzsLcYQWyNEUCNvA8bj/hW84+mZFt01rV5jXIOyE+/voClMz0Y7WAKOF1XiqtcN8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747494187; c=relaxed/simple;
	bh=0I1eiVOJEdVLLXIohuqFusEWQMPeVi5Dp73/GaN/bZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6CBLF9Il68Cnfs782kckM7bMnEvFYE6hCjzbT9ks91psSwQ/8PKLvmaZ3P6XMlJ+hEt3HDTAcDQrmLKRgBzfauBfE/TZrwwJ68eQtwjprVfW5qc1PHxDUBUA9pnky1a2sZ4kkwegQHot9ICFzBPhEhOXO444yAU24A71SveyFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=K4490URf; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70a2970cb70so27793227b3.0
        for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747494185; x=1748098985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NTpCRL9xhCjiiet8qAMOfllcsVau1k8+ucYSc+O5KM=;
        b=K4490URfks6tr9jn8LqvKaTG0G3arWwIyUz/hYiwUHy5vP69Uk/3qdDOSbzm8zCVmW
         oElnbeUeKqdv8DBESWoFm8cCLrcRnoe71LeOpOlF6NxaQybDTBf2HL2pm7DorY6SWMc8
         M7RGF5bGgDbi42iyjYbaYMUZ+/UtD2iB2CDIMVbgEKOrhVw0QDlgC1hqZvwpvSA+B/n/
         f+4xVtzk6vqX1PHA0/g2gzNPxksXtM1EutFARSBniMpMYifo9mqnF+U8OLaDIcBdyXra
         cUjiLfghFY5Bf1WPqRxBYcL/Ng/MPVBKbIp+UG/30/Ce9YXnvHMCYvD4RFN/44fJXcY3
         8rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747494185; x=1748098985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NTpCRL9xhCjiiet8qAMOfllcsVau1k8+ucYSc+O5KM=;
        b=Clyf2cToSLPN4UvJLbT1ulEqlnRr2MUISK+NvJpz/UTvhGsgdJpTnqny03wPeaY8dn
         vKTLtJGeRzGIAmNsZIO6IQK9tcJ1XEnLv+qvbjSWFc2hTH6YzgiACvAAEDwKuxAEata+
         FOINboRugYlBNeE11das/Eu81HK9wcYGKvwe4+PLAEJefgALZ8YGKfmGsT9UTNm58x2t
         e8Sz8gOUgKfAXkNozTfg0ZDAHHGZkZV64LRcKZlkjWxdQNE2sLQYxYwG5riLfBFdUIho
         hzhUW5CcqB0G//zLPO1eFEVHMYl0cXsOawq3R5ERDUG/y2UXkrZa+9MIDgI6qeNYwDV2
         9G1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDJaPFrddB1KD/20reeCOSRUBf+RA6X1kmYd4SzqcA4uDdI5pjSoGcwp/BzrbC1a7Bd0jqAaXnAnTMbrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzehg3qF+OL1bDimn/yF5JQLrLB4M0MqujMUnfl9zF23VRlJqID
	Qoi5izwnpWYDr6obo7xxYWfuN7f3dn0gMvWORxXUnostwv6eZsUghscuSR5oeMQPwk7dXEPMFNZ
	V4Nm/+rJkd1MCZaDUyR0DCjZABUdLN2OstaDmGgWE
X-Gm-Gg: ASbGnctqKkp6yurqCjwTHDvZ3DaiJtetPyX/fSmnhGmTQA5UMJpS6duF7iSEuF+2273
	clhoDt/GmQbHRDA2eRONrZAIpW3TfjgfQ2PUtsxNNVaZ/1re6uXGL5TdsMqzY+lx5nkNkWrUzmS
	PstXyYrXIfm+taPPntF5vKzZAIkhGCxFNB
X-Google-Smtp-Source: AGHT+IH4cvXZ2A6B3NQOnryIolvKUjfmtGf2pZQLNvPvX7nedF6oJ2mP2HSmm3dkkvdcM65QuaIOMlI3AMimnH5TpLo=
X-Received: by 2002:a05:690c:3749:b0:70c:b882:2f3 with SMTP id
 00721157ae682-70cb882052emr47413877b3.4.1747494184512; Sat, 17 May 2025
 08:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502184421.1424368-1-bboscaccy@linux.microsoft.com>
 <20250502210034.284051-1-kpsingh@kernel.org> <CAHC9VhS5Vevcq90OxTmAp2=XtR1qOiDDe5sSXReX5oXzf+siVQ@mail.gmail.com>
 <CACYkzJ5jsWFiXMRDwoGib5t+Xje6STTuJGRZM9Vg2dFz7uPa-g@mail.gmail.com>
 <CACYkzJ6VQUExfyt0=-FmXz46GHJh3d=FXh5j4KfexcEFbHV-vg@mail.gmail.com>
 <CAHC9VhQL_FkUH8F1fvFZmC-8UwZh3zkwjomCo1PiWNW0EGYUPw@mail.gmail.com>
 <CACYkzJ4+=3owK+ELD9Nw7Rrm-UajxXEw8kVtOTJJ+SNAXpsOpw@mail.gmail.com>
 <CAHC9VhTeFBhdagvw4cT3EvA72EYCfAn6ToptpE9PWipG9YLrFw@mail.gmail.com> <CAADnVQJ4GDKvLSWuAMdwajA0V2DEw5m-O228QknW8Eo9jxhyig@mail.gmail.com>
In-Reply-To: <CAADnVQJ4GDKvLSWuAMdwajA0V2DEw5m-O228QknW8Eo9jxhyig@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 17 May 2025 11:02:53 -0400
X-Gm-Features: AX0GCFuTvPgKKVsi_C1ZZBN1jNV8jcEHmfkcEtykXlcuzLm0gL1ZiUersRDfwfQ
Message-ID: <CAHC9VhTJcV1mqBpxVUtpLhrN4Y9W_BGgB_La5QCqObGheK28Ug@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: KP Singh <kpsingh@kernel.org>, Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, bpf <bpf@vger.kernel.org>, 
	code@tyhicks.com, Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>, 
	David Howells <dhowells@redhat.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jarkko Sakkinen <jarkko@kernel.org>, 
	James Morris <jmorris@namei.org>, Jan Stancek <jstancek@redhat.com>, 
	Justin Stitt <justinstitt@google.com>, keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas@fjasle.eu>, nkapron@google.com, 
	Roberto Sassu <roberto.sassu@huawei.com>, "Serge E . Hallyn" <serge@hallyn.com>, 
	Shuah Khan <shuah@kernel.org>, Matteo Croce <teknoraver@meta.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, kysrinivasan@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 7:49=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Fri, May 16, 2025 at 12:49=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> >
> > I think we need some clarification on a few of these details, it would
> > be good if you could answer the questions below about the
> > authorization aspects of your design?
> >
> > * Is the signature validation code in the BPF verifier *always* going
> > to be enforced when a signature is passed in from userspace?  In other
> > words, in your design is there going to be either a kernel build time
> > or runtime configuration knob that could selectively enable (or
> > disable) signature verification in the BPF verifier?
>
> If there is a signature in union bpf_attr and it's incorrect
> the prog_load command will be rejected.
> No point in adding a knob to control that.

I agree that when a signature is provided and that signature check
fails, the BPF load should be rejected.  I'm simply trying to
understand how you envision your design handling all of the cases, not
just this one, as well as what build and runtime options you expect
for controlling various aspects of this behavior.

> > * In the case where the signature validation code in the BPF verifier
> > is active, what happens when a signature is *not* passed in from
> > userspace?  Will the BPF verifier allow the program load to take
> > place?  Will the load operation be blocked?  Will the load operation
> > be subject to a more granular policy, and if so, how do you plan to
> > incorporate that policy decision into the BPF program load path?
>
> If there is no signature the existing loading semantics will remain intac=
t.
> We can discuss whether to add a sysctl or cgroup knob to disallow
> loading when signature is not present ...

As mentioned earlier this week, if the BPF verifier is performing the
signature verification as KP described, we will need a LSM hook after
the verifier to serve as an access control point.  Of course that
doesn't preclude the addition of some type of sysctl/cgroup/whatever
based access control, but the LSM hook would be needed regardless.

> but it probably should be a job of trivial LSM ...

Exactly.  If the LSM is simply verifying the signature validation
state of the BPF program being loaded it seems like an addition to IPE
would be the best option from an upstream, in-tree perspective.
However, with the post verifier LSM hook in place, one could also
supply a BPF LSM to do something similar.

It sounds like we are in agreement on the desirability and need for a
post verifier LSM hook; we'll keep moving forward with this idea
despite KP's earlier objections to the hook.

> Note that the prog verification itself is independent of the signature.
> If prog fails to pass safety checks it will still be rejected
> even if signature is ok.

There is plenty of precedence for a kernel subsystem rejecting a
security relevant operation before a LSM access control hook is
called; the reasons range from discretionary access control issues to
simple matters of resource exhaustion.  The possibility of the BPF
verifier rejecting the program load due to verifier constraints is
reasonable and expected.

> We're not going to do a verifier bypass.

Agreed.  I don't recall anyone ever suggesting that as part of this
recent BPF signature verification effort.

--=20
paul-moore.com

