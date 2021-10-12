Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03D142AD88
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 22:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhJLUCS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 16:02:18 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49195 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbhJLUCR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 16:02:17 -0400
Received: from leknes.fjasle.eu ([92.116.69.156]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N2BQM-1mkamx44CM-013fqp; Tue, 12 Oct 2021 21:59:50 +0200
Received: from lillesand.fjasle.eu (unknown [10.10.0.51])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "lillesand.fjasle.eu", Issuer "Fake LE Intermediate X1" (not verified))
        by leknes.fjasle.eu (Postfix) with ESMTPS id 9DEA93C062;
        Tue, 12 Oct 2021 21:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1634068787; bh=SDNWooDxN+hW1fHqOH3QYEFwTGIaEcBi9435tsNXDTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mLFNjzjs/Vnoum1dFAWj7OALHEaIDHtiMXc7WN6F3xr44FUZMgqA0VB7TMiBs8jvz
         Ihw0vmcFyA9nNgEPeGvZw34zssfUN7wtWEnddyDO3naPET+kmRhkoLWF66BrcUvcKC
         PAf/Y394WbX0TJ/mde95w5vfHiKlqY7ibuSHfies=
Received: by lillesand.fjasle.eu (Postfix, from userid 1000)
        id 7F7BA1045BD; Tue, 12 Oct 2021 21:59:46 +0200 (CEST)
Date:   Tue, 12 Oct 2021 21:59:46 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Thomas =?iso-8859-1?Q?K=FChnel?= <thomas.kuehnel@avm.de>
Subject: Re: [PATCH v2] initramfs: Check timestamp to prevent broken cpio
 archive
Message-ID: <YWXpMnMIX8AKumS6@lillesand.fjasle.eu>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Thomas =?iso-8859-1?Q?K=FChnel?= <thomas.kuehnel@avm.de>
References: <20211012185234.3295982-1-nicolas@fjasle.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211012185234.3295982-1-nicolas@fjasle.eu>
X-Operating-System: Debian GNU/Linux bookworm/sid
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:cK46y886Ufo4xgy6WFuNJfP7MRNLxscrcolIyhj3iPuf1qPJwvA
 rzeUPil2g3PADN/uoMghM5hY4U6Mb9eXAH9thiJQ0E6s67W201pjlQapqDTp7to75XRu5+G
 06dglQ23TuRhHRvAYi1YAt8k6cZAv+MsvOWDgZxKAmwczsn4WnWGEoqZn6OLlDgd5N4bc0p
 3cYEHo0V6rEY6e3axH8Eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5PcPrbPUtck=:ZMWX9GaE95U1f8KUccMnw6
 IIPAPPWyDP6X8uypVOoUjuVWUiA6WEeaV6ihjYYzHyJPlLPEjQjuG3bQ1sWD/KW49QK8WsU/H
 3dJZfrIiwNdOvOCzNVyWMb7VqE4v9wz/wY40TivjT8Hk5FrRg4Xr6r5qWcMJCbOeD7ScWfu0O
 iosato9Dw10EajxICnt0xprbMEB/+t+LkDCo788NWC2t88JacWed46YGoi6bssVSfvzLQDYRY
 HbHOkBNIPdZJquNrcLxeM33P8Rbl4z/75nAdGpMeCv7iJ9Uo12b80pzURIlYmlJQVc8ak6pb8
 ACjRVcpaxS1CGnhqznlEcvpwDCvu7lK0Sx60Y0AGBJmZIcQy9GI8lnDIuc9KTnY90N6yyunsh
 WXz5rGfkDna/ynxCQd4pCNwrYY1LFQpCn1kYLEI/PKR7bR164Xl54xv3adLH/CS6ZH+y9FfDV
 JCLxeZ65Ik6AN0iTd7d2CN8+3qNoopibtpbufPfCCyqCCxvt29sOv5ukYRGDItuXAMVSmFJPg
 CqvEqBopp5w3fVVVX2INmUXdvZAnqEuM3d4qrnLITq9lYuzLAMoiUA5lmAcWlVCyDuDgdsSOe
 uYStgzz8WeaArm4neLWoOLxIxT2DeBDQMtTmRSGlFLRWiHsbM4qDV0F+I9YVtTKgjJzzy2L5H
 3odIjjleD4zqM9IqRbRbv2j94LlOqRE96UxryXs66C6Ny5eofoi9cXwrEFyilv7HSZPl7MA2L
 grKJYQ22md+izp+h6RXh4FW/aP7irtsyRHZbTw==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue 12 Oct 2021 18:52:34 GMT Nicolas Schier wrote:
> Cpio format reserves 8 bytes for an ASCII representation of a time_t 
> timestamp.
> While 2106-02-07 06:28:15 UTC (time_t = 0xffffffff) is still some years in the
> future, a poorly chosen date string for KBUILD_BUILD_TIMESTAMP, converted into
> seconds since the epoch, might lead to exceeded cpio timestamp limits that
> result in a broken cpio archive.  Add timestamp checks to prevent overrun of
> the 8-byte cpio header field.
> 
> My colleague Thomas Kühnel discovered the behaviour, when we accidentally fed
> SOURCE_DATE_EPOCH to KBUILD_BUILD_TIMESTAMP as is: some timestamps (e.g.
> 1607420928 = 2021-12-08 10:48:48) will be interpreted by `date` as a valid date
> specification of science fictional times (here: year 160742).  Even though this
> is bad input for KBUILD_BUILD_TIMESTAMP, it should not break the initramfs
> cpio format.
> 
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Thomas Kühnel <thomas.kuehnel@avm.de>
> ---
>  usr/gen_init_cpio.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> -- 
> Changes v1 to v2:
>   * add timezone name (UTC) to specific time stamps
>   * fix typo: results -> result 
> 
> diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
> index 03b21189d58b..584ea45cff70 100644
> --- a/usr/gen_init_cpio.c
> +++ b/usr/gen_init_cpio.c
> @@ -320,6 +320,12 @@ static int cpio_mkfile(const char *name, const char *location,
>  		goto error;
>  	}
>  
> +	if (buf.st_mtime > 0xffffffff) {
> +		fprintf(stderr, "%s: Timestamp exceeds maximum cpio timestamp, clipping.\n",
> +			location);
> +		buf.st_mtime = 0xffffffff;
> +	}
> +
>  	filebuf = malloc(buf.st_size);
>  	if (!filebuf) {
>  		fprintf (stderr, "out of memory\n");
> @@ -551,6 +557,17 @@ int main (int argc, char *argv[])
>  		}
>  	}
>  
> +	/*
> +	 * Timestamps after 2106-02-07 06:28:15 UTC have an ascii hex time_t
> +	 * representation that exceeds 8 chars and breaks the cpio header
> +	 * specification.
> +	 */
> +	if (default_mtime > 0xffffffff) {
> +		fprintf(stderr, "ERROR: Timestamp 0x%08x too large for cpio format\n",

"0x%08x" is at least missing an 'l'.  Possibly, showing the invalid 
timestamp does not make much sense.  If someone feeds the string 
"1607420928" into KBUILD_BUILD_TIMESTAMP, as written in the commit 
message, $(date -d $KBUILD_BUILD_TIMESTAMP +%s) returns a value that 
will probably not be helpful.

Sorry for the noise; v3 follows.

> +			default_mtime);
> +		exit(1);
> +	}
> +
>  	if (argc - optind != 1) {
>  		usage(argv[0]);
>  		exit(1);
> -- 
> 2.30.1

-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --
