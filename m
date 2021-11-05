Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E9F4462F2
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Nov 2021 12:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhKELnk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Nov 2021 07:43:40 -0400
Received: from codesynthesis.com ([188.40.148.39]:60664 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhKELnj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Nov 2021 07:43:39 -0400
Received: from brak.codesynthesis.com (197-255-152-207.static.adept.co.za [197.255.152.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id CB61B605A6;
        Fri,  5 Nov 2021 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1636112459;
        bh=GYg53yeeoA/Wt1qwgUzlcZdcaUJ9Yg+EcWoqR+UG4ao=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=el6+tlzMqkW6VVTAUifGFqW1+VyXncJ3SkEEgvkhbrLt+5GQO+RLPWJ+ENSqGUDU1
         VPMHlZiHL5QCNN7fjvREVVTVUWE1uBdfCoAnfXPH1IgtuxVN0eeIrOA0C4F9k2CL1B
         s4sb0DvX4oYUb0PxXVt/NjN4+ICdu0bbJMkdWAhYn31jhzhSoPdORK5aieNNCUbwZb
         C/t5JFzxaY2XBhM9i3GsxZusZbfbinNqaAu0f56NsAVPkZDisd07r1xNyY9Pv8QEr+
         0zRo8na7H1ekm2h17UmVqWKu9gUoFyCsmo/K63gBqhvtyLugwrHoj1estlSYWUCIWD
         RrVJVr0jg9BJA==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 3BCDA1A800C4; Fri,  5 Nov 2021 13:40:54 +0200 (SAST)
Date:   Fri, 5 Nov 2021 13:40:54 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/10] kconfig: refactor conf_write_symbol()
Message-ID: <boris.20211105133811@codesynthesis.com>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
 <20211001053253.1223316-3-masahiroy@kernel.org>
 <boris.20211028071331@codesynthesis.com>
 <CAK7LNASx05b8pWJDaBbRE8rMZ_ceL1qFCMZQ9Dy21pJsuTM_+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASx05b8pWJDaBbRE8rMZ_ceL1qFCMZQ9Dy21pJsuTM_+w@mail.gmail.com>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> Without this patch, there are some functions that start with double
> underscores.
> 
> For example,
> 
>   __expr_eliminate_eq() in scripts/kconfig/expr.c
>   __expand_string()  in scripts/kconfig/preprocess.c
> 
> Are they problematic as well?

Yes, they could be potentially problematic. Identifiers that start
with double underscores or with a single underscore followed by an
uppercase letter are reserved for use by the C implementation (for
example, as a pre-defined macro).
