Return-Path: <linux-kbuild+bounces-4832-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8249D6C77
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Nov 2024 03:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BDBC2815AE
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Nov 2024 02:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E3FEAD0;
	Sun, 24 Nov 2024 02:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlwBTwah"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0D41370;
	Sun, 24 Nov 2024 02:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732414284; cv=none; b=YIkh76c8DZJBNGzzNL3ytD0+pWmTVkGGPOf4B63SM/fNYqamAiiDVu36y8Aq1retKoNnyIL8rf5cEfARHXZjOfoNCb5m0gY2PIxG1s3nqLzYYl1GnCTq5wUT1b2CfPN4AYEEd7E7ZpXa4CiPJuKICiHV5gi6TsfcLwok4OH9ziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732414284; c=relaxed/simple;
	bh=S+emmCzwyCoks7S9zsw5tQlX8wEFWEQd/iSHmrWwfvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayZxCwC8QFJ2H4KILSLuXPaS0WUSKK8nBb1iVaQuoN1uIrm/6hDAHYaqlN0JoOGQO14H6Rle5RM567Ze8rF2GI5XacFM16l/+rZv41GDpIL8nBaowdsFgJyiIBhG6ewxeqYqZKeybwaUe/Fgw9fzF+dB5kNcd+/grLbMb928O0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlwBTwah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63447C4CED2;
	Sun, 24 Nov 2024 02:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732414284;
	bh=S+emmCzwyCoks7S9zsw5tQlX8wEFWEQd/iSHmrWwfvA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nlwBTwahIpQQLyszSpsEnTZOL8bEiQSSRDH9o7+pZzZicoW6wAjA7fbyhGJxTlbq+
	 07Me+FM1wod59M2dBRFoToDSu3v8K2C+eyvvRbJw/CLew/Ko2+SK4D58Xiw8DbMS23
	 tm76Vqiw6T8kBoUePQTJW+qPNTgkT5V0R2lCrOuRioY8rBIu2qOmzhi7JugAdXD8CE
	 9yNoe4uZm0Cxr8b3sTzpegMbIrcZZfQUWkdG87fK6MU7h6VxRdT2fkKWYwil5FWm7X
	 tANN0xyDOyJfzcZxqOwp3QmtgQcdW0NKfzVLkArfSw9MA78CpNMcK1Fyx4qo4zh+2C
	 8Osy/UwiRbKBQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53d9ff8f1e4so3654487e87.2;
        Sat, 23 Nov 2024 18:11:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKK4Ccdbr3c7gi/XH+XnViggAoU7Gl0acPMpbWU0mkQ96ygfOLUFbSct0WpEVVJO4AcNCSZxO47BwOXFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPGLfBO+VqrrwQGVZNBdxy0ngYwZUIvx3cU7FjqpA1KVrkWvbz
	jvZnDbiSCOse5sU4D6wGTW91u9u3iObGtB5HaDe42X1ehfXN5xS1KczghMn5vjHFuUE7o1jXh5L
	4aVMcZErs6z5eiOr6eBfnIFysAf4=
X-Google-Smtp-Source: AGHT+IEeqMMFx6TRXmt8noXgqSRRHXqPMMV4q92iZCiAxBk8TrNBnD9s6tUDwR+dc3Lkvcf1aESFbGsFe2ZnzFyWpsw=
X-Received: by 2002:ac2:4a64:0:b0:53d:d951:bbfc with SMTP id
 2adb3069b0e04-53dd951be49mr2730077e87.55.1732414282943; Sat, 23 Nov 2024
 18:11:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122150037.1085800-1-linux@rasmusvillemoes.dk>
 <CAK7LNAS6aU4L+4JyDXzncMVsY+6XRYTD=RkhcXSUXTRh_WxWWw@mail.gmail.com> <87iksdk3ag.fsf@prevas.dk>
In-Reply-To: <87iksdk3ag.fsf@prevas.dk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 24 Nov 2024 11:10:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNASq+iTgjhCYdwkmgDmyPTbtORgU6UWrs889S4x1xkCHxg@mail.gmail.com>
Message-ID: <CAK7LNASq+iTgjhCYdwkmgDmyPTbtORgU6UWrs889S4x1xkCHxg@mail.gmail.com>
Subject: Re: [PATCH v4] setlocalversion: work around "git describe" performance
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jeff King <peff@peff.net>, Sean Christopherson <seanjc@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 24, 2024 at 7:12=E2=80=AFAM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On Sat, Nov 23 2024, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > On Sat, Nov 23, 2024 at 12:01=E2=80=AFAM Rasmus Villemoes
> > <linux@rasmusvillemoes.dk> wrote:
>
> >> v4:
> >>
> >> - Switch the logic to make use of the return values from try_tag,
> >>   instead of asking whether $count has been set.
> >
> >
> > No, please do not do this.
> >
> > As I replied in v3, my plan is to set -e, because otherwise
> > the shell script is fragile.
> >
> > With this version, -e will not work in try_tag()
> > because it is used in the if condition.
>
> I'm confused. Previously you said that "either style is fine with
> me".

That was my comment in v2.

At that time, I was not aware that the -e option was missing
in this script.

Sorry, I changed my mind.

In v3, I commented what I like this script to look like
when turning on the -e option.
Then, you came back with a different approach.


> Now you've invented some necessity to add "set -e", which of course
> yes, is then suppressed inside try_tag. But there is not a single
> statement within that that would cause "set -e" to exit anyway: The only
> one that is not a simple assignment or is itself a test is the "set --
> $()", and git rev-list failing there does not cause set -e to trigger.

This is correct, but think about the resiliency when someone
adds more code to try_tag() in the future.


> Aside from that, I'm skeptical to introducing set -e anyway, it's simply
> too hard to reason about what it will actually
> do. http://mywiki.wooledge.org/BashFAQ/105 . But you're the maintainer.



First, set -e is almost always useful because it is not realistic
to add '|| exit 1' for every command.

For example, see commit bc53d3d777f81385c1bb08b07bd1c06450ecc2c1
how the -e catches an error.

Second, the link you reference is exaggerating.

For example, the article mentioned the quirks in the Bash mode.
This argument is not applicable in our case because
Bash runs in the POSIX mode when it is invoked as 'sh'.
Since this script is invoked by #!/bin/sh,
'set -e' follows the POSIX behavior whether /bin/sh is a
symlink to bash or dash.
The -e option is propagated to subshell executions.
(It would not if the shebang had been #!/bin/bash,
but Bash still provides "set -o posix" to cater to this case).

In the referred link, I do not find a good reason to
avoid using the -e option.

When a function returns a value (yes/no question just like
try_tag()), you need to be careful about the possible
third case.

1) yes
2) no
3) error


I hope the following provides even more clarification.

Let's say, is_ancestor_tag() checks if the given tag is
an ancestor or not.



[Bad Code]

set -e

if is_ancestor_tag "${tag}"; then
        # Any error in is_ancestor_tag() is ignored.
        # "Yes, ... " may be printed even if  an error occurs.
        echo "Yes, ${tag} is an ancestor"
else
        echo "No, ${tag} is not an ancestor"
fi


[Good Code 1]

set -e

ret=3D$(is_ancestor_tag "${tag}")
# If any error occurs in is_ancestor_tag()
# the script is terminated here.

if [ "${ret}" =3D yes ]; then
        echo "Yes, ${tag} is an ancestor"
else
        echo "No, ${tag} is not an ancestor"
fi


[Good Code 2]

set -e

# is_ancestor_tag() sets 'ret' in the function body
is_ancestor_tag "${tag}"
if [ "${ret}" =3D yes ]; then
        echo "Yes, ${tag} is an ancestor"
else
        echo "No, ${tag} is not an ancestor"
fi


V3 is [Good Code 2], as the return value, 'count' is assigned
within the try_tag() function, and the caller checks it.








> >> +try_tag() {
> >> +       tag=3D"$1"
> >> +
> >> +       # Is $tag an annotated tag?
> >> +       [ "$(git cat-file -t "$tag" 2> /dev/null)" =3D tag ] || return=
 1
> >> +
> >> +       # Is it an ancestor of HEAD, and if so, how many commits are i=
n $tag..HEAD?
> >> +       # shellcheck disable=3DSC2046 # word splitting is the point he=
re
> >> +       set -- $(git rev-list --count --left-right "$tag"...HEAD 2> /d=
ev/null)
> >> +
> >> +       # $1 is 0 if and only if $tag is an ancestor of HEAD. Use
> >> +       # string comparison, because $1 is empty if the 'git rev-list'
> >> +       # command somehow failed.
> >> +       [ "$1" =3D 0 ] || return 1
> >> +
> >> +       # $2 is the number of commits in the range $tag..HEAD, possibl=
y 0.
> >> +       count=3D"$2"
> >
> > Redundant double-quotes.
>
> Perhaps, but sorry, I'm not code-golfing, and trying to remember when
> quotes can be elided when variables are referenced is simply not
> something I spend my very limited brain capacity on.
>
> Feel free to make any adjustments you want and commit that, or drop
> this, I'm not sending a v5 as that seems to be a waste of everybody's
> time.
>
> Rasmus



--
Best Regards
Masahiro Yamada

