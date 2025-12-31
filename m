Return-Path: <linux-kbuild+bounces-10388-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB449CEB791
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 08:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80582300D412
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 07:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857852DC77B;
	Wed, 31 Dec 2025 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsSJulX+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640EF3A1E82
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Dec 2025 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767167425; cv=none; b=SMG4prOZEvGJFKfrGO8WW3U1BoOr1ZxB0SYVGzmCbJ1rUZn3A+KLe/Lo5T584o0zIq1HrCKaIJJF4A06pM/PY6y/nw+1zAZEZ1sBmY/eo3zuQ/yOFPGuBik+Q/1JVEfJzhkB1B2R8gqzTVbyFQABnBLgTBZDxUYPaaWevT/dGXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767167425; c=relaxed/simple;
	bh=fxEzaQ6lkFLGA60S2/GrY3erz6kciiVpJIW+iahBKt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2raN2LgtpdrOcZVzrXBDLhtUUs+Zy3nKWEY5La46etnhKBHw+qcUlQHgr2lOhcGFWwfKPyghqyogsr0Go2JfxKOSegH1cgXJkLTWK/zmIknylu1dwNQ3MJId+tuXCRVPI6RQuN5LUD8HggOvYrSE3a8qN8C/WwQMMVC/RAU2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsSJulX+; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5958931c9c7so12053218e87.2
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Dec 2025 23:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767167420; x=1767772220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7fhWwk1OIIngc9+BNbJ57EwGtjW+U+G1SAXRVs840o=;
        b=KsSJulX+n6Z9p5ZBgI2kZlHKURstxpIBQAyKmR2QcqXrKVhawy7NTGU2bOGRLmUy1i
         +C+W3xFAURo/gBAsqrHueiKS0aIJkqnZjv0Uf75jMN+bZDOVXDQgHVQise53wrweBb1O
         cLaEGULTeB/MYyrzCLo2brQVyKJ7RNc6rw6rLgtR6lzeftDJ8b9ocOSNgnRjossvuxnP
         TL1OrAr30xHLhM+W0yUIp0Uc30N0Fhs5/SX3bhdd6JSZrs42Gii5NL4gR2dqVVGSUDFO
         CX+Om03XHPj6uXOgWE0VPsrUgAe9bX90Ia+sKB4R+01W/IDk6t8igelCWf5j9DyzahBQ
         r34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167420; x=1767772220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7fhWwk1OIIngc9+BNbJ57EwGtjW+U+G1SAXRVs840o=;
        b=WDhEYAPFlOG0+FmQ9Fy/2717dph2d7gIXUMUnbgRAelF1VGVgtjs09jjMvdhLCCxZ9
         IH9bLOW9rip6btmwPrIIb90QdbD5LCkEcmYQZAolJxOsp1PhT/2bA5iRlNZxJZY4y7Rl
         ObIwUElome69z96QcyZ87TSH/uLaFGFi3EVE0MXhzf+sPC1/BQpB/rsRN+rQDqjPqJ6M
         +MGee0pqw8Y/ad/zuQke9IwZ8jJu3FCozKt4iqKjwgDtB9sUPOWJlf/Xfs26GWYG1/+P
         INCGa32D4TpF8m5OkIkLV3XL+zSm/wcnfHRy43swyq8AkrlBvQfJ9/Qcj8XGIjWwMFgm
         GJbw==
X-Forwarded-Encrypted: i=1; AJvYcCV4tMiwy1pySSlITXVJVPVGSo8CHiRtEq0YMtvW+OafSmGYvmbGvpsFdJGlTv6ghfnZoy9Vr+AmbDuMmPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwODihEYwGvRd2UwaGdNV7U+6F5HtwZsz/FE8zBhN4Ac1qDYW7U
	d1V+bmaPFydJ7KYWJOoehuyNSTkDj2Os5/oyVYQDQZ2l2u87KWlnEdoCz6aNCi00SuA=
X-Gm-Gg: AY/fxX5Tyydm4C3MfqwuVcbnWOa/YBfso+svbEA6Jc5EDNFl5Al4Wl9NzT9A1/p8Ee+
	sRrb5R2iOSAdo3uONdAhlMcWB/CbQ3bfBSMYenPyTbeROja8m+LHSe+WYZ/4tyYCZK6i1hqW6XL
	I6hf28kyG4poN7s7Bwcd7DTNNWw0BWid8no+9pvCG3OBDXOvwKWpR967chBczZT89Zic7BIBUh1
	/ileEhRvPtj7XCcxJrlHr48p3odrAnxecf+MhBM62pzHOxAKMi09OPWuYKZyNS8SeoKLe6Td2+w
	B16P2G8HwNj9MPqeQA7Nmx1JBDIJeYzzCv5TblCrzIclTcsupAZ2MijlmumfeVPXBNkT4tad3+C
	xAoa0l9s/OoV4TQjBCcC4+aSlBeeQs2tpt9nKrcfpl/LxbjnXwa3Ynj3L18E+1BCuVWs5rx8HUo
	hs3ISu33NgymM141ZSmRVr46YF4+jBuCIEiJjHeNfrpDh0
X-Google-Smtp-Source: AGHT+IHPeGYwEIg1sfdKZUrJLzCCdo6/6keVmm3o6KtBA+7sbS3jVHsPf6XffXT2ipsDqtxUVRscTA==
X-Received: by 2002:a05:6512:4016:b0:598:f4cb:aafd with SMTP id 2adb3069b0e04-59a17d958b8mr13239980e87.19.1767167420313;
        Tue, 30 Dec 2025 23:50:20 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ea6sm10683304e87.5.2025.12.30.23.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:50:19 -0800 (PST)
Date: Wed, 31 Dec 2025 09:50:18 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] scripts: kconfig: merge_config.sh: refactor from
 shell/sed/grep to awk
Message-ID: <aVTVugHI-gqnVOqa@nuoska>
References: <20251229114447.45236-1-mikko.rapeli@linaro.org>
 <20251230205549.GE4062669@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230205549.GE4062669@ax162>

Hi,

On Tue, Dec 30, 2025 at 01:55:49PM -0700, Nathan Chancellor wrote:
> Hi Mikko,
> 
> I don't really know awk well so I won't give as much review on that
> part.
> 
> On Mon, Dec 29, 2025 at 01:44:45PM +0200, Mikko Rapeli wrote:
> > From: Anders Roxell <anders.roxell@linaro.org>
> > 
> > merge_config.sh shell/sed/grep loop scales poorly and is slow.
> > With Yocto genericarm64 kernel and around 190 config fragments
> > the script takes more than 20 minutes to run on a fast build machine.
> > Re-implementation with awk does the same job in 10 seconds.
> > Using awk since it is likely available in the build environments
> > and using perl, python etc would introduce more complex runtime
> > dependencies. awk is good enough and lot better than shell/sed/grep.
> > 
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  scripts/kconfig/merge_config.sh | 161 ++++++++++++++++++++++++--------
> >  1 file changed, 123 insertions(+), 38 deletions(-)
> > 
> > diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> > index 79c09b378be8..46397d7c6957 100755
> > --- a/scripts/kconfig/merge_config.sh
> > +++ b/scripts/kconfig/merge_config.sh
> > @@ -16,8 +16,8 @@
> >  set -e
> >  
> >  clean_up() {
> > -	rm -f $TMP_FILE
> > -	rm -f $MERGE_FILE
> > +	rm -f "${TMP_FILE}"
> > +	rm -f "${TMP_FILE}.new"
> >  }
> >  
> >  usage() {
> > @@ -121,7 +121,6 @@ SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
> >  SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
> 
> The SED_CONFIG_EXP variables are unused now so they can be removed.

Right, removing in v2.

> >  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> > -MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)
> >  
> >  echo "Using $INITFILE as base"
> >  
> > @@ -136,42 +135,128 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
> >  		echo "The merge file '$ORIG_MERGE_FILE' does not exist.  Exit." >&2
> >  		exit 1
> >  	fi
> > -	cat $ORIG_MERGE_FILE > $MERGE_FILE
> > -	CFG_LIST=$(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $MERGE_FILE)
> > -
> > -	for CFG in $CFG_LIST ; do
> > -		grep -q -w $CFG $TMP_FILE || continue
> > -		PREV_VAL=$(grep -w $CFG $TMP_FILE)
> > -		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
> > -		BUILTIN_FLAG=false
> > -		if [ "$BUILTIN" = "true" ] && [ "${NEW_VAL#CONFIG_*=}" = "m" ] && [ "${PREV_VAL#CONFIG_*=}" = "y" ]; then
> > -			${WARNOVERRIDE} Previous  value: $PREV_VAL
> > -			${WARNOVERRIDE} New value:       $NEW_VAL
> > -			${WARNOVERRIDE} -y passed, will not demote y to m
> > -			${WARNOVERRIDE}
> > -			BUILTIN_FLAG=true
> > -		elif [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
> > -			${WARNOVERRIDE} Value of $CFG is redefined by fragment $ORIG_MERGE_FILE:
> > -			${WARNOVERRIDE} Previous  value: $PREV_VAL
> > -			${WARNOVERRIDE} New value:       $NEW_VAL
> > -			${WARNOVERRIDE}
> > -			if [ "$STRICT" = "true" ]; then
> > -				STRICT_MODE_VIOLATED=true
> > -			fi
> > -		elif [ "$WARNREDUN" = "true" ]; then
> > -			${WARNOVERRIDE} Value of $CFG is redundant by fragment $ORIG_MERGE_FILE:
> > -		fi
> > -		if [ "$BUILTIN_FLAG" = "false" ]; then
> > -			sed -i "/$CFG[ =]/d" $TMP_FILE
> > -		else
> > -			sed -i "/$CFG[ =]/d" $MERGE_FILE
> > -		fi
> > -	done
> > -	# In case the previous file lacks a new line at the end
> > -	echo >> $TMP_FILE
> > -	cat $MERGE_FILE >> $TMP_FILE
> > -done
> > +	# Use awk for single-pass processing instead of per-symbol grep/sed
> > +	if ! awk -v prefix="$CONFIG_PREFIX" \
> 
> Please use the AWK variable from Kbuild here:
> 
>   if ${AWK} -v prefix="$CONFIG_PREFIX" \
> 
> You can do something like:
> 
>   if [ -z "${AWK}" ]; then
>       AWK=awk
>   fi
> 
> towards the top of the script to have the script continue to work
> outside of Kbuild as well.

Ok will add this in v2.

> > +		-v warnoverride="$WARNOVERRIDE" \
> > +		-v strict="$STRICT" \
> > +		-v builtin="$BUILTIN" \
> > +		-v warnredun="$WARNREDUN" '
> > +	BEGIN {
> > +		strict_violated = 0
> > +		cfg_regex = "^" prefix "[a-zA-Z0-9_]+"
> > +		notset_regex = "^# " prefix "[a-zA-Z0-9_]+ is not set$"
> > +	}
> > +
> > +	# Extract config name from a line, returns "" if not a config line
> > +	function get_cfg(line) {
> > +		if (match(line, cfg_regex)) {
> > +			return substr(line, RSTART, RLENGTH)
> > +		} else if (match(line, notset_regex)) {
> > +			# Extract CONFIG_FOO from "# CONFIG_FOO is not set"
> > +			sub(/^# /, "", line)
> > +			sub(/ is not set$/, "", line)
> > +			return line
> > +		}
> > +		return ""
> > +	}
> > +
> > +	# Normalize: strip trailing comments, convert "is not set" to "=n"
> > +	function normalize(line) {
> > +		if (line == "") return ""
> > +		sub(/[[:space:]]+#.*/, "", line)
> > +		if (line ~ / is not set$/) {
> > +			sub(/^# /, "", line)
> > +			sub(/ is not set$/, "=n", line)
> > +		}
> > +		return line
> > +	}
> > +
> > +	function warn_builtin(cfg, prev, new) {
> > +		if (warnoverride == "true") return
> > +		print cfg ": -y passed, will not demote y to m" > "/dev/stderr"
> > +		print "  Previous value: " prev > "/dev/stderr"
> > +		print "  New value:	 " new > "/dev/stderr"
> > +		print "" > "/dev/stderr"
> > +	}
> > +
> > +	function warn_redefined(cfg, prev, new) {
> > +		if (warnoverride == "true") return
> > +		print "Value of " cfg " is redefined by fragment " mergefile ":" > "/dev/stderr"
> > +		print "  Previous value: " prev > "/dev/stderr"
> > +		print "  New value:	 " new > "/dev/stderr"
> > +		print "" > "/dev/stderr"
> > +	}
> > +
> > +	function warn_redundant(cfg) {
> > +		if (warnredun != "true" || warnoverride == "true") return
> > +		print "Value of " cfg " is redundant by fragment " mergefile ":" > "/dev/stderr"
> > +	}
> > +
> > +	# First pass: read merge file, store all lines and index
> > +	FILENAME == ARGV[1] {
> > +	        mergefile = FILENAME
> > +		merge_lines[FNR] = $0
> > +		merge_total = FNR
> > +		cfg = get_cfg($0)
> > +		if (cfg != "") {
> > +			merge_cfg[cfg] = $0
> > +			merge_cfg_line[cfg] = FNR
> > +		}
> > +		next
> > +	}
> >  
> > +	# Second pass: process base file (TMP_FILE)
> > +		cfg = get_cfg($0)
> > +
> > +		# Not a config or not in merge file - keep it
> > +		if (cfg == "" || !(cfg in merge_cfg)) {
> 
>   I get an error on this line when trying to use this script via the arm64
>   virtconfig target:
> 
>   $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- clean virtconfig
>   awk: cmd. line:70:              if (cfg == "" || !(cfg in merge_cfg)) {
>   awk: cmd. line:70:              ^ syntax error
>   make[2]: *** [arch/arm64/Makefile:222: virtconfig] Error 1
>   ...
> 
>   $ awk --version | head -1
>   GNU Awk 5.3.2, API 4.0, PMA Avon 8-g1, (GNU MPFR 4.2.2, GNU MP 6.3.0)

Oops. Sorry, there is a curly brace missing:

@@ -216,6 +214,7 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
        }

        # Second pass: process base file (TMP_FILE)
+       {
                cfg = get_cfg($0)

                # Not a config or not in merge file - keep it

but this is fatal so I had been testing an old version of the patch
in my yocto/bitbake setup. I will double check this with v2.

Cheers,

-Mikko

