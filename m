Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D2231BACF
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Feb 2021 15:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhBOOOX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 09:14:23 -0500
Received: from codesynthesis.com ([188.40.148.39]:52066 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhBOOOV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 09:14:21 -0500
Received: from brak.codesynthesis.com (unknown [105.186.239.143])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id A9B3E5EDB5;
        Mon, 15 Feb 2021 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1613398415;
        bh=QZ52mYrWtYrNNz5G+n8kvOcR+EaCKc16WZHazAaMjvc=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=SUdkJitfu+StrsGa3uf+D2eMzqiQv5E3bdMR5I3xFKY+kf6Kv977jYfCfxI24q+gR
         Bzw4ZBxgiZ8rCaC+rLlCOlByuoAYcGgNaCQ7rDUR4nw4w9R1KuYzb+Q0ihcbB37gC4
         7/FIORv7+buxfxFROjN0FyaEttVN/WxvrS04vnmk/e3ugOT75T5MglKwDzoc5Vr8KK
         Cd3oRLEn6S0Yk6K2VxWSjJQNJKq4aT82tt/tvhRAggTRVaTEYdnK9v7oyyEpotB7Kv
         5H3QtTrytlCzxjAbvZyHXUoXH105uhcVsJ51IRlnKGsfkKXKbQDDDm6U1LtpktPFIa
         7XKrpRMzn3H1g==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 0427F1A800A2; Mon, 15 Feb 2021 16:13:29 +0200 (SAST)
Date:   Mon, 15 Feb 2021 16:13:28 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>
Subject: Re: [PATCH v1 2/3] kconfig: Ask user if string needs to be changed
 when dependency changed
Message-ID: <boris.20210215155804@codesynthesis.com>
References: <20210215122513.1773897-1-mic@digikod.net>
 <20210215122513.1773897-3-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210215122513.1773897-3-mic@digikod.net>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Mickaël Salaün <mic@digikod.net> writes:

> Content of string configuration may depend on related kernel
> configurations.  Modify oldconfig and syncconfig to inform users about
> possible required configuration update and give them the opportunity to
> update it:
> * if dependencies of this string has changed (e.g. enabled or disabled),
> * and if the current value of this string is different than the (new)
>   default one.

I have a number of questions:

1. Why is a change in dependencies necessarily means that the dependent's
   value must be revised? Here is a specific example (to make sure we are
   talking about the same things):

   config FOO
     string "Foo value"
     depends on BAR || BAZ

   Why, in the general case, when I disable BAR and enable BAZ I must
   also revise the value of FOO?

2. How do you know that what's in the user's .config is the old default
   and in Kconfig -- the new default value? What if in the user's .config
   is a custom value (with which the user is perfectly happy) and what's
   in Kconfig is the old default (which the user has already seen)?

3. Why limit this to strings only?


> This is particularly relevant for CONFIG_LSM which contains a list of
> LSMs enabled at boot, but users will not have a chance to update this
> list with a make oldconfig.

If my understanding above is correct, this feels like it's been purpose-
made to address whatever issue you are having with CONFIG_LSM. If so,
what about potential numerous other options that don't have this issue
but will now be presented to the user for modification?
