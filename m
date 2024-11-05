Return-Path: <linux-kbuild+bounces-4520-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846A9BD9C1
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 00:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79E1FB210C5
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2024 23:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2E821621B;
	Tue,  5 Nov 2024 23:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5V/saDb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E531D1F79;
	Tue,  5 Nov 2024 23:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730849632; cv=none; b=DQybJQFBOkkO4XQIfo6xQDl0kusiCaYpXSTD15Rouza8mcsHMzTtrNpLVjw+SWxasD51t+7qZ6cdMPqZd3kSzV6NXsuX2sbXDXchvMtyw0vG9Iuzh78gG59a4/So8vQa/eYQz6Hdtgc9fX++svuPYmukg4pUWlSBH9q2XM5PSJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730849632; c=relaxed/simple;
	bh=QHI+wwzfVZxBUMpFpA54NjSU2ksTEPpsBrYkMgLBBLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfS2TPsvepAkPUrbBJPXkUmAll74WuaK5KtL+8s7kM5aTLESvWjrhbPai301XsdAtm0b8kE2sJq5nt9DBaFkkVDB+uAsGXBMt026NYwLiEVxDTNR7bzh8I37cQaY15lwp0q/ZC7FnELCwTm4vnc4AQ1U24XaK4SQdm/yCcFlKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5V/saDb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98D5C4CED3;
	Tue,  5 Nov 2024 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730849631;
	bh=QHI+wwzfVZxBUMpFpA54NjSU2ksTEPpsBrYkMgLBBLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J5V/saDb/KJZdqrKQ1V1Y8XNTzphHtliQ+SD3HzN1eQcmBa9/YOahwVSgsIv5VZij
	 BLxMRRJ4CBU+2ebh2Oy9y/j9icMn/O3TeDUod2OtxXfvQPcn7Wh1Iexh0LLjXHRZDA
	 asEflod9oe7ngKt5kiYGP2Aoo2XPKR605pxwm+QsxdMtjcVj8tlFSsL7GB3II/9L3H
	 F78qT7ANkk1ibTMOzbXy9U1Mighq9802RYjp0rc9R6095yyFO3PHHQogqOWKfmAGWs
	 aeUQYw8enOvplN+V9uDMDPv1snK7evR1RUqtVZCdEa7xBwDWPjobnkJO2MGKGGE2im
	 Dmewyo8tewR3Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f1292a9bso7004744e87.2;
        Tue, 05 Nov 2024 15:33:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3TtJiuDl5aXdCLrYf4A6KOP/mnWNPDknG6Qq/fNa8XogXMfzCDO4/iCq4FhMhjAjYeV4ZtFGBBnKz8EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuNB/41ZA2d02D64b+3nKZ+2i+ArF+i4WSVbBBSHVCpTl6CMQ7
	nmdg97tF9EuWNapkZeyhndghcJHZeIifyvH6pPDugTgh/9buHm4FQEcBQPTbmE/+VsIH0kDdC1v
	nRMIg2rWRAE5BPsVAerQPpm7V6AI=
X-Google-Smtp-Source: AGHT+IHiA0xhJICDe3U8xuUU+bYaFNvF3OT809WNQMFjMZior0Tcj7JoqkJwawctOdY9wfxtv61wqgMnEyGqhcDU6f8=
X-Received: by 2002:a05:6512:1314:b0:534:3cdc:dbef with SMTP id
 2adb3069b0e04-53b3491cd2amr21662326e87.43.1730849630447; Tue, 05 Nov 2024
 15:33:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com> <20241014141345.5680-6-david.hunter.linux@gmail.com>
In-Reply-To: <20241014141345.5680-6-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Nov 2024 08:33:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmV=CGzEyJtBRSfz+YW6yTfWza7mf1dPXEiaJDT7z5xQ@mail.gmail.com>
Message-ID: <CAK7LNAQmV=CGzEyJtBRSfz+YW6yTfWza7mf1dPXEiaJDT7z5xQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] streamline_config.pl: fix: implement choice for kconfigs
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: multipart/mixed; boundary="00000000000062147f062632d582"

--00000000000062147f062632d582
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:14=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Properly implement the config entries that are within the choice keyword
> for kconfig. Currently, the script only stops the previous config entry
> when a choice keyword is encountered.
>
> When the keyword "choice" is encountered, do the following:
>         - distribute the lines immediately following the "choice"
>           keyword to each config entry inside the "choice" section.
>         - process the config entries with the distributed lines.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
> V1 https://lore.kernel.org/all/20240913171205.22126-6-david.hunter.linux@=
gmail.com/
>
> V2
>         - changed the subject prefix
>         - changed the method for storing and distributing the choice
>           block. No longer using temp file.
> ---
>  scripts/kconfig/streamline_config.pl | 47 ++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index b7ed79c5e070..4149c4b344db 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -149,6 +149,34 @@ my $var;
>  my $iflevel =3D 0;
>  my @ifdeps;
>
> +# distributes choice entries to different config options
> +sub set_hash_value {
> +    my %htable =3D %{$_[0]};
> +    my $tmp_config =3D $_[1];
> +    my $current_config =3D $_[2];
> +    if (defined($htable{$tmp_config})) {
> +       ${$_[0]}{$current_config} =3D $htable{$tmp_config};
> +    }
> +}
> +
> +# distribute choice config entries
> +sub copy_configs {
> +    my $tmp_config =3D "TMP_CONFIG";
> +    my $choice_config =3D $_[0];
> +    set_hash_value (\%depends, $tmp_config, $choice_config);
> +    set_hash_value (\%selects, $tmp_config, $choice_config);
> +    set_hash_value (\%prompts, $tmp_config, $choice_config);
> +    set_hash_value (\%defaults, $tmp_config, $choice_config);
> +}
> +
> +sub delete_temp_config {
> +    my $tmp_config =3D "TMP_CONFIG";
> +    $depends{$tmp_config} =3D undef;
> +    $selects{$tmp_config} =3D undef;
> +    $prompts{$tmp_config} =3D undef;
> +    $defaults{$tmp_config} =3D undef;
> +}
> +


I previously suggested checking how the 'if' statement is handled.
https://lore.kernel.org/lkml/CAK7LNAQ8D4OVT81iTVs8jjrBXX6Zgwc+VJ_vb7hb4J-vC=
ZZN=3Dg@mail.gmail.com/


These two behave in a similar way
regarding the dependency propagation.


if FOO
config A
           bool "A"

config B
           bool "B"
endif



choice
         prompt "choose"
         depends on FOO
config A
           bool "A"
config B
           bool "B"
endchoice


The inner A and B inherit the dependency on FOO.

I attached a completely-untested patch.
I think 'if' and 'choice' can share the code.


BTW, 'menu' also can have 'depends on'.


menu "menu"
         depends on FOO
config A
           bool "A"
config B
           bool "B"
endmenu


This is not implemented, either.

I am not sure how much effort should be invested in this script, though.


--=20
Best Regards
Masahiro Yamada

--00000000000062147f062632d582
Content-Type: text/x-patch; charset="US-ASCII"; name="choice.diff"
Content-Disposition: attachment; filename="choice.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m352zl0z0>
X-Attachment-Id: f_m352zl0z0

ZGlmZiAtLWdpdCBhL3NjcmlwdHMva2NvbmZpZy9zdHJlYW1saW5lX2NvbmZpZy5wbCBiL3Njcmlw
dHMva2NvbmZpZy9zdHJlYW1saW5lX2NvbmZpZy5wbAppbmRleCA4ZTIzZmFhYjVkMjIuLjI4ZmFm
OGNkMGUyYSAxMDA3NTUKLS0tIGEvc2NyaXB0cy9rY29uZmlnL3N0cmVhbWxpbmVfY29uZmlnLnBs
CisrKyBiL3NjcmlwdHMva2NvbmZpZy9zdHJlYW1saW5lX2NvbmZpZy5wbApAQCAtMTQ2LDcgKzE0
Niw3IEBAIG15ICVvYmplY3RzOwogbXkgJWNvbmZpZzJrZmlsZTsKIG15ICVkZWZhdWx0czsKIG15
ICR2YXI7Ci1teSAkaWZsZXZlbCA9IDA7CitteSAkaWZsZXZlbCA9IC0xOwogbXkgQGlmZGVwczsK
IAogIyBwcmV2ZW50IHJlY3Vyc2lvbgpAQCAtMjA2LDcgKzIwNiw3IEBAIHN1YiByZWFkX2tjb25m
aWcgewogCSAgICAkY29uZmlnMmtmaWxleyJDT05GSUdfJGNvbmZpZyJ9ID0gJGtjb25maWc7CiAK
IAkgICAgIyBBZGQgZGVwZW5kcyBmb3IgJ2lmJyBuZXN0aW5nCi0JICAgIGZvciAobXkgJGkgPSAw
OyAkaSA8ICRpZmxldmVsOyAkaSsrKSB7CisJICAgIGZvciAobXkgJGkgPSAwOyAkaSA8PSAkaWZs
ZXZlbDsgJGkrKykgewogCQlpZiAoJGkpIHsKIAkJICAgICRkZXBlbmRzeyRjb25maWd9IC49ICIg
IiAuICRpZmRlcHNbJGldOwogCQl9IGVsc2UgewpAQCAtMjIxLDYgKzIyMSwxMCBAQCBzdWIgcmVh
ZF9rY29uZmlnIHsKIAkgICAgJGRlcGVuZHN7JGNvbmZpZ30gPSAkMTsKIAl9IGVsc2lmICgkc3Rh
dGUgZXEgIkRFUCIgJiYgL15ccypkZXBlbmRzXHMrb25ccysoLiopJC8pIHsKIAkgICAgJGRlcGVu
ZHN7JGNvbmZpZ30gLj0gIiAiIC4gJDE7CisJfSBlbHNpZiAoJHN0YXRlIGVxICJOT05FIiAmJiAv
XlxzKmRlcGVuZHNccytvblxzKyguKikkLykgeworCSAgICAjICJkZXBlbmRzIG9uIiBpbiB0aGUg
Ik5PTkUiIHN0YXRlIGlzIGZyb20gYSBjaG9pY2UgYmxvY2suCisJICAgICMgUHJvcGFnYXRlIHRo
ZSBkZXBlbmRlbmN5IHRvIGl0cyBtZW1iZXIgY29uZmlnIG9wdGlvbnMuCisJICAgICRpZmRlcHNb
JGlmbGV2ZWxdIC49ICc6JyAuICRpZmRlcHNbJGlmbGV2ZWxdOwogCX0gZWxzaWYgKCRzdGF0ZSBu
ZSAiTk9ORSIgJiYgL15ccypkZWYoXyhib29sfHRyaXN0YXRlKXxhdWx0KVxzKyhcUy4qKSQvKSB7
CiAJICAgIG15ICRkZXAgPSAkMzsKICAgICAgICAgICAgICRkZWZhdWx0c3skY29uZmlnfSA9IDE7
CkBAIC0yNTMsMTEgKzI1OCwxNiBAQCBzdWIgcmVhZF9rY29uZmlnIHsKIAogCSAgICBteSBAZGVw
cyA9IHNwbGl0IC9bXmEtekEtWjAtOV9dKy8sICRkZXBzOwogCi0JICAgICRpZmRlcHNbJGlmbGV2
ZWwrK10gPSBqb2luICc6JywgQGRlcHM7CisJICAgICRpZmRlcHNbKyskaWZsZXZlbF0gPSBqb2lu
ICc6JywgQGRlcHM7CiAKLQl9IGVsc2lmICgvXmVuZGlmLykgeworCX0gZWxzaWYgKC9eXHMqY2hv
aWNlXHMqJC8pIHsKIAotCSAgICAkaWZsZXZlbC0tIGlmICgkaWZsZXZlbCk7CisJICAgICRzdGF0
ZSA9ICJOT05FIjsKKwkgICAgJGlmZGVwc1srKyRpZmxldmVsXSA9ICcnOworCisJfSBlbHNpZiAo
L14oZW5kaWZ8ZW5kY2hvaWNlKS8pIHsKKworCSAgICAtLSRpZmxldmVsIGlmICgkaWZsZXZlbCA+
IC0xKTsKIAogCSMgc3RvcCBvbiAiaGVscCIgYW5kIGtleXdvcmRzIHRoYXQgZW5kIGEgbWVudSBl
bnRyeQogCX0gZWxzaWYgKC9eXHMqKC0tLSk/aGVscCgtLS0pP1xzKiQvIHx8IC9eKGNvbW1lbnR8
Y2hvaWNlfG1lbnUpXGIvKSB7Cg==
--00000000000062147f062632d582--

